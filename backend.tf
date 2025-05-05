terraform {
  backend "s3" {
    bucket = "tf-backend-os"
    key    = "ec2/terraform.tfstate"
  }
}