module "main_vpc" {
  source               = "../modules/vpc"
  vpc_cidr             = "172.21.0.0/16"
  public_subnets_cidr  = ["172.21.21.0/24", "172.21.22.0/24"]
  private_subnets_cidr = ["172.21.46.0/24", "172.21.47.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
  enable_public_ip     = "true"
  enable_dns           = "true"
  vpc_name             = "prod-vpc"
  sgname = "allowssh"
}

module "public_bucket" {
  source   = "../modules/s3"
  bucket   = "public-bucket-testos"
  tag_name = "public_bucket"
  tag_env  = "prod"
}

module "new_iam_user" {
  source   = "../modules/iam"
  iam_user = "test-user"
  policy_arn = module.readonly_policy.policy_arn
}

module "readonly_policy" {
  source             = "../modules/iam_policy"
  policy_name        = "AllowS3EC2ReadOnly"
  policy_description = "Read-only access to EC2 and S3"
  policy_document    = data.aws_iam_policy_document.s3_ec2_readonly.json
}

module "ec2" {
  source              = "../modules/ec2"
  subnet_id           = module.main_vpc.public_subnet_id[0]
  security_group_id   = module.main_vpc.sgid
  key_name            = "my-key"
  associate_public_ip = true
  instance_name       = "test-instance"
}

