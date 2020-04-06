output "sensor_instance_id" {
  value = aws_cloudformation_stack.sensor_stack.outputs.InstanceId
}

output "sensor_private_ip" {
  value = aws_cloudformation_stack.sensor_stack.outputs.PrivateIP
}