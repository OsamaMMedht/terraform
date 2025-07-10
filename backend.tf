terraform {
  backend "s3" {
    bucket         = "tf-be-data"
    key            = "backend/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
