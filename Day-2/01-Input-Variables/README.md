# Terraform Input Variables Explained

This guide explains how to use **input variables** in Terraform, covering their types, structure, and usage — especially focusing on `string`, `number`, `bool`, `list`, `map`, and `tuple`. 

---

##  What Are Input Variables?

Terraform **input variables** allow you to **parameterize values** in your configuration so you can easily reuse and customize your infrastructure across environments like `dev`, `stage`, and `prod`.

---

##  Basic Syntax

```hcl
variable "<name>" {
  type        = <type>
  description = "<description>"
  default     = <optional_default_value>
}
```

---

##  Types of Input Variables

### 1. String

```hcl
variable "env" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-${var.env}-bucket"
}
```

### 2. Number

```hcl
variable "instance_count" {
  type        = number
  description = "Number of EC2 instances"
  default     = 2
}

output "instance_info" {
  value = "You have requested ${var.instance_count} instances"
}
```

### 3. Boolean

```hcl
variable "enable_monitoring" {
  type        = bool
  description = "Enable or disable monitoring"
  default     = true
}

output "monitoring_status" {
  value = var.enable_monitoring ? "Monitoring is ON" : "Monitoring is OFF"
}
```

### 4. List of Strings

```hcl
variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones"
  default     = ["us-east-1a", "us-east-1b"]
}

output "primary_az" {
  value = var.availability_zones[0]
}
```

### 5. Map

```hcl
variable "instance_types" {
  type        = map(string)
  description = "Instance types per environment"
  default = {
    dev  = "t3.micro"
    prod = "t3.large"
  }
}

output "dev_instance_type" {
  value = var.instance_types["dev"]
}
```

### 6. Tuple

```hcl
variable "app_metadata" {
  type        = tuple([string, number, bool])
  description = "App name, version, and feature flag"
  default     = ["frontend", 1, true]
}

output "app_name" {
  value = var.app_metadata[0]
}
```

---

##  Indexing in Lists and Tuples

- Both `list` and `tuple` support **index-based access**, starting at **0**.
- For `list`, all items must be of the **same type**.
- For `tuple`, you can mix types, but **order and length must match** the declaration.

**Example:**
```hcl
var.availability_zones[1]  # returns the second AZ in the list
var.app_metadata[2]        # returns 'true' (the boolean in the tuple)
```

---

##  List vs Tuple

| Feature            | List                                      | Tuple                                         |
|--------------------|-------------------------------------------|-----------------------------------------------|
| Type Constraint    | All elements must be of same type         | Can include different types                  |
| Length             | Dynamic                                   | Fixed-length                                  |
| Example Use Case   | List of AZs, subnets, names               | App config like ["frontend", 1, true]         |
| Indexing           | Yes (starts from 0)                       | Yes (starts from 0)                           |
| Declaration Syntax | `list(string)`                            | `tuple([string, number, bool])`               |

---

##  Summary

Use input variables to:
- Keep your code DRY and reusable
- Handle multiple environments
- Parameterize values like AZs, names, and settings

Let your variables do the heavy lifting ✨

