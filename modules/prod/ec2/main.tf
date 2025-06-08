resource "aws_instance" "mainec2module" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = var.name
    Environment = var.environment
  }
}