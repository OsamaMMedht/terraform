data "aws_availability_zones" "available" {}

data "aws_iam_policy_document" "s3_ec2_readonly" {
  statement {
    actions = [
      "ec2:Describe*",
      "s3:Describe*"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "ops_admin" {
  statement {
    actions = [
      "ec2:*",
      "s3:*",
      "rds:*"
    ]
    resources = ["*"]
  }
}