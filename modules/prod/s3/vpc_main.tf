resource "aws_s3_bucket" "s3" {
  bucket = var.bucket

  tags = {
    Name        = var.tag_name
    Environment = var.tag_env
  }
}
