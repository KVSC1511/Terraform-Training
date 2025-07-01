# Terraform Modules 

This guide walks through Terraform modules in a structured way. It includes definitions, reasons for using modules, real problems they solve, best practices, and clarifies common doubts with examples.

---

## 1. What is a Terraform Module?

A Terraform module is a set of Terraform configuration files grouped together in a folder. It represents a specific piece of infrastructure you want to reuse — like EC2 instances, VPCs, S3 buckets, etc.

Think of a module like a reusable Lego block — assemble once, use many times.

There are two types:
- Root Module: The main folder where you run `terraform init` and `apply`
- Child Module: Reusable modules you create or pull from sources like the Terraform Registry

---

## 2. Why Use Terraform Modules?

Modules help you:

- Avoid code duplication: Write once, use many times
- Improve clarity: Keep root code minimal and focused
- Speed up development: Build faster by reusing tested code
- Enforce standards: Apply consistent tagging, naming, and security settings
- Simplify maintenance: Fix bugs or make updates in one place and reflect them everywhere

---

## 3. What Problems Do Modules Solve (With Examples)

Problem 1: Code Repetition

Before:  
You copy-paste the same aws_instance block for Dev, QA, and Prod. You change only the name and AMI.

After (Using Module):
```
module "dev" {
  source        = "./modules/ec2"
  instance_name = "dev-server"
  ami_id        = "ami-xyz"
}

module "qa" {
  source        = "./modules/ec2"
  instance_name = "qa-server"
  ami_id        = "ami-abc"
}
```

Inside the module:
```
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  tags = {
    Name = var.instance_name
  }
}
```

Problem 2: Lack of Reusability

Scenario:  
You want to create multiple S3 buckets for different services. Without modules, you're duplicating the logic.

Using Module:
```
module "s3_billing" {
  source      = "./modules/s3"
  bucket_name = "billing-bucket"
}
```

Module Code:
```
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}
```

Problem 3: Inconsistent Standards

Each developer writes their own EC2 config with random tags or security group names.

With Modules:  
Define a standard module with fixed tagging, IAM roles, SG naming — all teams must use it.

Problem 4: Scaling Infrastructure

You need 10 EC2s with the same config in different environments.

Using for_each with Module:
```
module "multi_ec2" {
  for_each       = toset(["dev", "qa", "stage"])
  source         = "./modules/ec2"
  instance_name  = "${each.key}-web"
  ami_id         = "ami-xyz"
}
```

---

## 4. Terraform Module Structure

Standard layout of a module folder:
```
modules/
└── ec2-instance/
    ├── main.tf        # Main resource definitions
    ├── variables.tf   # Inputs to parameterize behavior
    ├── outputs.tf     # Outputs to expose values
    └── README.md      # (Optional) usage instructions
```

---

## 5. Calling a Module in Root Configuration

```
module "web_server" {
  source        = "./modules/ec2-instance"
  instance_name = "my-web"
  ami_id        = "ami-123"
}
```

You can also use:
- GitHub: `source = "git::https://github.com/your-org/terraform-modules.git//ec2-instance"`
- Terraform Registry: `source = "terraform-aws-modules/vpc/aws"`

---

## 6. Common Question: Why Use Modules If I Can Just Change the Variables?

You are right that you can create another resource by changing the variables. But that becomes inefficient as your infrastructure grows.

# Without module:
```
resource "aws_instance" "dev" {
  ami           = "ami-123"
  instance_type = "t3.micro"
  tags = { Name = "dev-server" }
}

resource "aws_instance" "qa" {
  ami           = "ami-456"
  instance_type = "t3.micro"
  tags = { Name = "qa-server" }
}
```

# With Modules

# Module code
```
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}
```
# Root code
```
module "dev" {
  source        = "./modules/ec2"
  instance_name = "dev-server"
  ami_id        = "ami-123"
}

module "qa" {
  source        = "./modules/ec2"
  instance_name = "qa-server"
  ami_id        = "ami-456"
}

```

Benefits of Using Modules:

1. Avoids repetition  
2. Centralized maintenance  
3. Enforces consistency across teams  
4. Makes root configuration cleaner  
5. Enables reuse across environments and projects  
6. Supports versioning and collaboration

Without modules, even small changes (e.g., enabling monitoring or adding a tag) must be updated everywhere manually. With modules, you change it in one place.

When to skip modules:  
- Very small, throwaway projects  
- Quick proofs of concept (PoC)

---

## 7. Tips for Writing Clean Modules

- Use clear and consistent naming
- Create a README in each module
- Define required variables and defaults in `variables.tf`
- Avoid hardcoding values
- Use outputs to expose values like instance_id, bucket_name, etc.
- Version your modules for shared usage
