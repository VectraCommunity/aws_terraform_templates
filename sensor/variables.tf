variable "region" {
    type = string
}

variable "vpc_cidr_range" {
    type = string
}

variable "baseName" {
    type = string
}

variable "brainIP" {
    type = string
}

variable "instanceType" {
    type = string
}

variable "networkLB" {
    type = string
}

variable "tenancy" {
    type = string
}

variable "registrationToken" {
    type = string
}

variable "sshKey" {
    type = string
}

variable "templateURL" {
    type = string
}

variable "mgtPrivateIP" {
    type = string
}

variable "mgtSecurityGroup" {
    type = string
}

variable "trafficPrivateIP" {
    type = string
}

variable "trafficSecurityGroup" {
    type = string
}
