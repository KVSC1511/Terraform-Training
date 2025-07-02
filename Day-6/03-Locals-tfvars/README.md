
# Understanding `locals` Block and `terraform.tfvars` in Terraform

This guide provides a deep dive into two important Terraform concepts:
- The `locals` block
- The `terraform.tfvars` file

With real-world scenarios, examples, and usage best practices.

---

## Part 1: The `locals` Block

### What is `locals`?

The `locals` block in Terraform allows you to define **reusable expressions** or **computed values** that you can reference throughout your configuration.

### Why use it?

1. Avoid repeating expressions (like tags or name formatting)
2. Make logic easier to maintain
3. Centralize naming conventions and calculations

### Basic Example:

```hcl
variable "environment" {
  default = "dev"
}

locals {
  bucket_name = "myapp-${var.environment}-logs"
}

resource "aws_s3_bucket" "logs" {
  bucket = local.bucket_name
  tags = {
    Name = local.bucket_name
    Environment = var.environment
  }
}
```

Without `locals`, you would repeat `"myapp-${var.environment}-logs"` multiple times.

---

### Advanced Example with VPC:

```hcl
locals {
  vpc_cidr = "10.0.0.0/16"
  azs      = ["us-east-1a", "us-east-1b", "us-east-1c"]

  private_subnets  = [for k, az in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  public_subnets   = [for k, az in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 4)]
  database_subnets = [for k, az in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 8)]
}
```

This dynamically creates subnet CIDRs based on the availability zones, avoiding manual CIDR calculation.

---

### Key Points:

- `locals` are **not inputs** – they are computed internally
- Use `local.<name>` to reference a local value
- They support expressions, conditionals, loops, etc.

---

## Part 2: `terraform.tfvars` – Why It Exists

### What is `terraform.tfvars`?

This file is used to **supply values to variables** externally, instead of hardcoding values inside your `.tf` files.

Terraform automatically loads `terraform.tfvars` (or any `.tfvars` file passed via `-var-file`).

---

### Why can't we just use variables alone?

Let’s say you declare:

```hcl
variable "region" {}
```

You **need to provide** a value for `region`.

You have 3 choices:
1. Inline via CLI: `terraform apply -var="region=us-east-1"`
2. Environment variable: `TF_VAR_region=us-east-1`
3. Use a `.tfvars` file: `terraform.tfvars`

---

### Scenario:

You have three environments: `dev`, `qa`, and `prod`.

Instead of editing the `.tf` code for each one, you can create:

**terraform.tfvars**:
```hcl
region     = "us-east-1"
environment = "dev"
```

**qa.tfvars**:
```hcl
region     = "us-west-2"
environment = "qa"
```

**prod.tfvars**:
```hcl
region     = "eu-central-1"
environment = "prod"
```

Then run:

```bash
terraform apply -var-file="qa.tfvars"
```

No code change. No risk.

---

### Key Benefits:

- Keep code DRY and environment-agnostic
- Safe to switch environments
- Supports automation and pipelines

---

## Real-World Analogy

Think of `variable` blocks as **form fields**.  
Think of `terraform.tfvars` as **filling out the form for a specific scenario or user**.

---

## Bonus: Common Confusion Resolved

### Why not just hardcode values in variables?

Because:
- You lose reusability
- Every environment change requires file edits
- Not scalable for large teams or pipelines

### Do I need both `variable` and `tfvars`?

Yes:
- `variable` defines what values Terraform expects
- `.tfvars` (or `-var`) supplies the actual values for that run

---

## Summary

| Concept             | Purpose                              | How to Use                          |
|---------------------|--------------------------------------|-------------------------------------|
| `locals`            | Internal reusable logic/calculations | Use `local.<name>`                  |
| `variable`          | Define expected input                | Use `var.<name>`                    |
| `terraform.tfvars`  | Provide values for variables         | Use `terraform.tfvars` or `-var-file` |

Together, these tools make your Terraform code:
- Modular
- Reusable
- Scalable
- Easy to manage across environments
