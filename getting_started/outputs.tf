//output variable. Terraform refresh will fetch the value of the output variable
//if the terraform apply is already performed.


output "instance_ip_address" {
  value = aws_instance.MyServer.public_ip
}