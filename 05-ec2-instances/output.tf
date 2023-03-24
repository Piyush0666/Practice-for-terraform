output "aws_security_group_http_server_details" {
  value = aws_security_group.http_server_sg_01
}
output "aws_instance_http_server_details" {
  value = aws_instance.http_server_01
}

output "aws_instance_http_server_public_dns_details" {
  value = aws_instance.http_server_01.public_dns
}

output "aws_default_vpc_details" {
  value = aws_default_vpc.my_default_vpc.id
}