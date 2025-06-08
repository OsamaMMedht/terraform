module "webservers" {
  source = "./modules/dev/ec2"

  ami           = var.ami
  instance_type = var.instance_type
  name          = "webserver"
  environment   = var.environment
  key_name      = var.key_name
}

module "dbserver" {
  source = "./modules/dev/ec2"

  ami           = var.ami
  instance_type = var.instance_type
  name          = "dbserver"
  environment   = var.environment
  key_name      = var.key_name
}
