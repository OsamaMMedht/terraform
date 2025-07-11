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
---

## Directory Structure

```bash
.
├── modules/                    # reusable infrastructure blocks
│   ├── vpc/
│   ├── ec2/
│   ├── iam/
│   └── iam_policy/
                      # isolated environments (dev, prod, etc.)
│ ── development/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── backend.tf
│   │   └── provider.tf
│ ── production/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── backend.tf
│       └── provider.tf

└── README.md
