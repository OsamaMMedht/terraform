# Terraform AWS Infrastructure

Complete AWS environment provisioned via Terraform modules.  
This project is designed for scalable, repeatable, and secure infrastructure deployments.

---

## Features

- Modular architecture for easy reuse
- VPC with:
  - Public and private subnets across multiple availability zones
  - Internet Gateway
  - Public route tables
- EC2 instance with:
  - AMI
  - Security Group
  - SSH access via Key Pair
- IAM user with:
  - Programmatic access (access key + secret)
  - Custom IAM policy (EC2 and S3 read-only)
- S3 remote backend with state locking (DynamoDB)
- tfvars support for environment-specific values

---

## Directory Structure

```bash
.
├── modules/
│   ├── ec2/
│   ├── iam/
│   ├── iam_policy/
│   ├── security_group/
│   └── vpc/
├── main.tf
├── provider.tf
├── backend.tf
├── terraform.tfvars
├── variables.tf
└── outputs.tf