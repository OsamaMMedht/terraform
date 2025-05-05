# Terraform EC2 Module Setup

Reusable Terraform module to create EC2 instances with environment-specific configurations using `.tfvars`.

---

## Project Structure

```
.
├── main.tf
├── variables.tf
├── dev.tfvars
├── prod.tfvars
└── modules/
    └── ec2/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

## Files Overview

### Root Files

- `main.tf`: Calls the EC2 module and passes variables
- `variables.tf`: Defines the input variables used in `main.tf`
- `dev.tfvars` / `prod.tfvars`: Provide environment-specific values

### Module Files (`modules/ec2`)

- `main.tf`: Defines the EC2 resource
- `variables.tf`: Declares required variables
- `outputs.tf`: Returns useful output like the instance ID

---

## Module Usage

### `main.tf`

```hcl
module "ec2_instance" {
  source        = "./modules/ec2"

  ami           = var.ami
  instance_type = var.instance_type
  name          = var.name
  environment   = var.environment
}
```

### `variables.tf`

```hcl
variable "ami" {}
variable "instance_type" {}
variable "name" {}
variable "environment" {}
```

---

## EC2 Module Details

### `modules/ec2/main.tf`

```hcl
resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name        = var.name
    Environment = var.environment
  }
}
```

### `modules/ec2/variables.tf`

```hcl
variable "ami" {}
variable "instance_type" {}
variable "name" {}
variable "environment" {}
```

### `modules/ec2/outputs.tf`

```hcl
output "instance_id" {
  value = aws_instance.this.id
}
```

---

## Environment Variable Files

### `dev.tfvars`

```hcl
ami           = "ami-0abcd1234"
instance_type = "t2.micro"
name          = "dev-server"
environment   = "dev"
```

### `prod.tfvars`

```hcl
ami           = "ami-0efgh5678"
instance_type = "t3.large"
name          = "prod-server"
environment   = "production"
```

---

## Usage Steps

### 1. Set up your AWS credentials

Export AWS credentials using environment variables or AWS CLI profile:

```bash
export AWS_ACCESS_KEY_ID=your_access_key
export AWS_SECRET_ACCESS_KEY=your_secret_key
```

or configure via profile:

```bash
aws configure
```

---

### 2. Initialize Terraform

```bash
terraform init
```

---

### 3. Validate the configuration

```bash
terraform validate
```

---

### 4. Format the code (optional but recommended)

```bash
terraform fmt
```

---

### 5. Generate and review the plan

```bash
terraform plan -var-file="dev.tfvars"
```

---

### 6. Apply the configuration

```bash
terraform apply -var-file="dev.tfvars"
```

---

### 7. Check outputs

```bash
terraform output
```

---

### 8. Destroy resources when done (for cleanup)

```bash
terraform destroy -var-file="dev.tfvars"
```

---