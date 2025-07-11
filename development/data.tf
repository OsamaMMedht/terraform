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