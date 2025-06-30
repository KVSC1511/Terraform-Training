# Understanding `for_each` in Terraform (EC2-Focused)

## What is `for_each` in Terraform?

`for_each` is a key-based loop in Terraform. It lets you loop over a **map(object)** or a **set of strings**, and gives each resource a unique key. This is useful when you want to manage multiple similar resources with custom values or names.

---

## Map of Object

A **map(object({ ... }))** is a Terraform data type that lets you define a group of named items, where:

- Each key in the map has a custom structure (value),

- And each value contains multiple attributes (fields).

**Example**
```
variable "ec2_config" {
  type = map(object({
    ami = string
    instance_type = string
  }))
  default = {
    "frontend" = {
      ami = "ami-05ffe3c48a9991133"
      instance_type = "t2.micro"
    }
    "backend" = {
      ami = "ami-020cba7c55df1f615"
      instance_type = "t3.micro"
    }
  }
}
```

1. The outer part is a map:
```hcl
{
  "frontend" = {...}
  "backend"  = {...}
}
```
- "frontend" and "backend" are the keys in the map.
-  Their corresponding values are objects.

2. Each thing after = is an value:
```
{
  ami           = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
}
{
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t3.micro"
}
```


## List of Strings

A **list** is an **ordered** collection of values.

Example:
```hcl
["dev", "qa", "prod"]
```

- Maintains order: index 0 = "dev", index 1 = "qa", etc.
- Allows duplicates: `["dev", "dev", "prod"]` is valid.
- Not allowed directly in `for_each` (unless you convert it to a set).

---

## Set of Strings

A **set** is an **unordered**, **unique** collection of values.

Example:
```hcl
["dev", "qa", "prod"]
```

- No order: You can’t rely on index positions.
- No duplicates: `["dev", "dev"]` becomes just `["dev"]`
- Perfect for `for_each`, because Terraform uses keys to track resource identity.

---

## Why `for_each` Needs a Set (or Map)

Terraform tracks resources based on **keys**, not indexes. That’s why `for_each` doesn’t accept a plain list — lists don’t have meaningful keys.

To convert a list into something usable by `for_each`, you must wrap it with `toset()`.

Example with EC2:
```hcl
resource "aws_instance" "example" {
  for_each = toset(["dev", "qa", "prod"])

  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"

  tags = {
    Name = each.key
  }
}
```

Each item becomes:
- `each.key = "dev"`
- `each.key = "qa"`
- `each.key = "prod"`

This allows Terraform to track and manage each EC2 instance independently using a unique key.

---

## What is `each` in Terraform?

When you use `for_each`, Terraform loops over a **set(strings)** or **map(objects)**.  
For each item in that loop, Terraform provides you with a built-in object called `each`.

This `each` object contains:

- `each.key` → The **unique identifier** of the item (the loop key)
- `each.value` → The **data/value** associated with that key

---

## Example 1: Using a Map with EC2 (custom config)

```hcl
variable "ec2_config" {
  type = map(object({
    ami           = string
    instance_type = string
  }))
  default = {
    "frontend" = {
      ami           = "ami-05ffe3c48a9991133"
      instance_type = "t2.micro"
    },
    "backend" = {
      ami           = "ami-020cba7c55df1f615"
      instance_type = "t3.micro"
    }
  }
}

resource "aws_instance" "custom" {
  for_each = var.ec2_config

  ami           = each.value.ami
  instance_type = each.value.instance_type

  tags = {
    Name = each.key
  }
}
```

## Visual Breakdown

| for_each Key | each.key     | each.value                                        |
| ------------- | ------------ | ------------------------------------------------- |
| "frontend"    | "frontend"   | { ami = "ami-aaa", instance_type = "t2.micro" }   |
| "backend"     | "backend"    | { ami = "ami-bbb", instance_type = "t3.micro" }   |

----
## Example 2: Using a Set with EC2

```hcl
for_each = toset(["dev", "qa", "prod"])
```

Each item is just a string.

Inside the resource block:

- `each.key` → "dev", "qa", "prod"
- `each.value` → same as `each.key` (because it's just a string)

They can be used to tag EC2 instances uniquely.

---

## Summary

| What                     | Used For                                                       |
| ------------------------ | -------------------------------------------------------------- |
| `each.key`               | Identifier name — ideal for `tags`, `names`, resource tracking |
| `each.value`             | The value or full config object for that key                   |
| `.ami`, `.instance_type` | Access fields inside `each.value` when it's a map of objects   |
