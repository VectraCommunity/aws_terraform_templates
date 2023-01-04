provider "aws" {
  region  = var.region
  profile = "bxp"
}

resource "aws_vpc" "sample-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}
resource "aws_subnet" "sample-subnet" {
  vpc_id     = aws_vpc.sample-vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_cloudformation_stack" "sensor_stack" {
  name = "sensor-stack"
  parameters = {
    baseName          = var.baseName
    brainIP           = var.brainIP
    instanceType      = var.instanceType
    mgtPrivateIP      = var.mgtPrivateIP
    mgtSecurityGroup  = var.mgtSecurityGroup
    mgtSubnet         = aws_subnet.sample-subnet.id
    mgtVpc            = aws_vpc.sample-vpc.id
    networkLB         = var.networkLB
    registrationToken = var.registrationToken
    sshKey            = var.sshKey
    tenancy           = var.tenancy
    trafficPrivateIP  = var.trafficPrivateIP
    trafficSecurityGroup = var.trafficSecurityGroup
    trafficSubnet     = aws_subnet.sample-subnet.id
    trafficVpc        = aws_vpc.sample-vpc.id
    
    
  }

  template_url = var.templateURL

}

output "sensor_instance_id" {
  value = aws_cloudformation_stack.sensor_stack.outputs.InstanceId
}


output "sensor_private_mgt_ip" {
  value = aws_cloudformation_stack.sensor_stack.outputs.PrivateManagementIP
}
