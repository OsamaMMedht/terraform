output "instance_id" {
  value = aws_instance.mainec2module.id
  
}

output "instance_name" {
  value = aws_instance.mainec2module.tags["Name"]
}
