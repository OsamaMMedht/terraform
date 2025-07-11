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

module "public_bucket" {
    source = "./modules/prod/s3"
    bucket = "public_bucket-testos"
    tag_name = "public_bucket"
    tag_env = "prod"
}