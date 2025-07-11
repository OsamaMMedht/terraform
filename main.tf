#VPCs
module "main_vpc" {
  source = "./modules/prod/vpc"
  vpc_cidr             = "172.21.0.0/16"
  public_subnets_cidr  = ["172.21.21.0/24", "172.21.22.0/24"]
  private_subnets_cidr = ["172.21.46.0/24", "172.21.47.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
  enable_public_ip     = "true"
  enable_dns           = "true"
  vpc_name             = "prod-vpc"
}

module "dev_vpc" {
  source = "./modules/dev/vpc"
  vpc_cidr             = "10.20.0.0/16"
  public_subnets_cidr  = ["10.20.20.0/24", "10.20.21.0/24"]
  private_subnets_cidr = ["10.20.22.0/24", "10.20.23.0/24"]
  availability_zones   = ["us-east-1c", "us-east-1d"]
  enable_public_ip     = "true"
  enable_dns           = "true"
  vpc_name             = "dev-vpc"
}

#S3
module "public_bucket" {
    source = "./modules/prod/s3"
    bucket = "public_bucket-testos"
    tag_name = "public_bucket"
    tag_env = "prod"
}