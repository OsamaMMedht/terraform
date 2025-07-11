vpc_cidr             = "10.0.0.0/16"
public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets_cidr = ["10.0.101.0/24", "10.0.102.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
enable_public_ip     = true
enable_dns           = true
vpc_name             = "prod-vpc"
