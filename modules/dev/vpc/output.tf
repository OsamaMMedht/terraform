output "dev_vpc_id" {
  value       = aws_vpc.my_vpc.id
  description = "The ID of the VPC"
}

output "dev_public_subnet_ip" {
  value       = aws_subnet.public[*].id
  description = "The ID of the VPC"
}

output "dev_private_subnets_ip" {
  value       = aws_subnet.private[*].id
  description = "The ID of the VPC"
}
