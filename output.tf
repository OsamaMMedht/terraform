output "vpc_id" {
  value = module.main_vpc.vpc_id
}

output "public_subnets_id" {
  value = module.main_vpc.public_subnet_id
}

output "private_subnets_id" {
  value = module.main_vpc.private_subnets_id
}

output "s3_bucketname" {
  value = module.public_bucket.s3
}

output "iam_username" {
  value = module.new_iam_user.iam_username
  
}

output "iam_policy" {
  value = module.readonly_policy.policy_arn  
}