# Terraform: Using `for_each` for EC2 Scenarios

## Overview

In today's session, we will explore how to use `for_each` in Terraform with EC2 resources, especially in scenarios where `count` falls short or becomes limiting. We already discussed `count` earlier — now let's focus on `for_each`.

---

## Why `for_each`?

- `for_each` allows us to create multiple resources where each one has a unique identity.
- It works with **maps** and **sets**, not lists.
- It enables **custom configurations** for each resource.
- More stable than `count` when adding/removing resources because it's **key-based**.

---

## Scenario 1: Create an EC2 Instance in Each Availability Zone

### Goal:
We want to launch one EC2 instance in **each Availability Zone** in a specific region.

### Step 1: Get AZs dynamically
```hcl
data "aws_availability_zones" "available" {
  state = "available"
}
```

### Step 2: Launch EC2 in each AZ using `for_each`
```hcl
resource "aws_instance" "az_ec2" {
  for_each = toset(data.aws_availability_zones.available.names)

  ami           = "ami-0c55b159cbfafe1f0"  # Use valid AMI
  instance_type = "t2.micro"
  availability_zone = each.key

  tags = {
    Name = "ec2-${each.key}"
  }
}
```

### Explanation:
- `each.key` is the AZ name (like `ap-south-1a`)
- This ensures one EC2 is created per AZ
- Cannot be done reliably with `count` since `count` is index-based and doesn’t track resource names well

---

## Scenario 2: Create a Dev Server (Amazon Linux) and Prod Server (Ubuntu)

### Goal:
- Create 2 EC2s:
  - One tagged as `dev-server` with Amazon Linux
  - One tagged as `prod-server` with Ubuntu

### Step 1: Define variable with a map
```hcl
variable "ec2_config" {
  type = map(object({
    ami           = string
    instance_type = string
  }))
  default = {
    "dev-server" = {
      ami           = "ami-amazonlinux"  # Replace with actual AMI ID
      instance_type = "t2.micro"
    },
    "prod-server" = {
      ami           = "ami-ubuntu"  # Replace with actual AMI ID
      instance_type = "t3.micro"
    }
  }
}
```

### Step 2: Use `for_each` to launch both
```hcl
resource "aws_instance" "custom" {
  for_each = var.ec2_config

  ami           = each.value.ami
  instance_type = each.value.instance_type

  tags = {
    Name = each.key
  }
}
```

### Explanation:
- `each.key` gives `"dev-server"` or `"prod-server"`
- `each.value.ami` and `each.value.instance_type` are pulled from the map
- More scalable and readable than using `count` with conditionals

---

## Summary

| Use Case                                     | Use `for_each`? | Why?                                           |
|---------------------------------------------|------------------|------------------------------------------------|
| EC2 in each AZ                               | ✅ Yes           | Based on unique AZ names, not numeric count    |
| EC2 with custom AMI per environment          | ✅ Yes           | Different config for each, key-based tracking  |
| Identical EC2s with no variation             | ❌ Use `count`   | Simpler unless unique tags or configs needed   |

---

Let me know if you want to extend this with EBS volumes or mixed region handling!
