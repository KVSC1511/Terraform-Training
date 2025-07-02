
# Terraform Functions Explained

This document explains commonly used Terraform functions with clear definitions, practical usage examples, and detailed explanations suitable for infrastructure and DevOps professionals.

---

## 1. basename(path.cwd)

### What it does:
Returns the last segment (folder name) of the path where Terraform is being executed. This is helpful in naming conventions.

### Example:
If your working directory is:

```
/Users/bala/terraform/environments/dev-vpc
```

Then:

```hcl
basename(path.cwd)
```

Returns:

```
"dev-vpc"
```

### Why it’s useful:
- Helps create dynamic names based on folder
- Useful in reusable module scenarios

---

## 2. slice(list, start, end)

### What it does:
Returns a portion (sub-list) of the list starting from `start` index and stopping before the `end` index.

### Example:
```hcl
slice(["a", "b", "c", "d"], 1, 3)
```

Returns:

```
["b", "c"]
```

### Why it’s useful:
- Helps limit the number of Availability Zones used
- Useful in dynamic subnet and resource creation

---

## 3. merge(map1, map2)

### What it does:
Combines two or more maps into one. If keys overlap, the last map's value is used.

### Example:
```hcl
merge(
  { Owner = "Bala", Environment = "dev" },
  { Project = "LTSS", Owner = "Team-A" }
)
```

Returns:

```
{ Owner = "Team-A", Environment = "dev", Project = "LTSS" }
```

### Why it’s useful:
- Simplifies tag management
- Enables flexible overrides of shared settings

---

## 4. join(separator, list)

### What it does:
Joins elements of a list into a single string with a separator.

### Example:
```hcl
join(",", ["dev", "qa", "prod"])
```

Returns:

```
"dev,qa,prod"
```

### Why it’s useful:
- Useful for security group CIDRs or user_data scripts

---

## 5. split(separator, string)

### What it does:
Splits a string into a list using the given separator.

### Example:
```hcl
split(",", "dev,qa,prod")
```

Returns:

```
["dev", "qa", "prod"]
```

### Why it’s useful:
- Useful when processing CSV-like values
- Converts inputs from environment variables into usable lists

---

## 6. lookup(map, key, default)

### What it does:
Returns the value of the given `key` in a `map`. If the key does not exist, it returns the `default` value.

### Example:
```hcl
locals {
  ami_map = {
    dev  = "ami-123",
    prod = "ami-789"
  }
}

lookup(local.ami_map, "qa", "ami-default")
```

Returns:

```
"ami-default"
```

### Why it’s useful:
- Prevents errors when accessing optional or missing keys
- Safe way to handle region/environment-based lookups

---

## 7. element(list, index)

### What it does:
Returns the value at the given index in the list. If the index is out of bounds, it wraps around (starts again from the beginning).

### Example:
```hcl
element(["a", "b", "c"], 4)
```

Index 4 wraps around the list of 3 items, so it returns:

```
"b"
```

### Why it’s useful:
- Round-robin distribution
- Selecting from lists in a loop without error

---

## 8. length(input)

### What it does:
Returns the number of items in a list, the number of characters in a string, or the number of keys in a map.

### Example:
```hcl
length(["a", "b", "c"])
```

Returns:

```
3
```

### Why it’s useful:
- Used in conditionals or loops to control repetition

---

## 9. compact(list)

### What it does:
Removes empty strings and null values from a list.

### Example:
```hcl
compact(["a", "", null, "b"])
```

Returns:

```
["a", "b"]
```

### Why it’s useful:
- Cleans up list values before processing

---

## 10. contains(list, value)

### What it does:
Checks whether a list contains a specific value.

### Example:
```hcl
contains(["dev", "prod"], "qa")
```

Returns:

```
false
```

### Why it’s useful:
- Input validation
- Conditional checks

---

## 11. lower() / upper()

### What it does:
Converts a string to lowercase or uppercase.

### Example:
```hcl
lower("PROD")
```

Returns:

```
"prod"
```

### Why it’s useful:
- Ensures case consistency in naming

---

## 12. replace(string, old, new)

### What it does:
Replaces all instances of a substring within a string.

### Example:
```hcl
replace("myapp-dev", "-dev", "-prod")
```

Returns:

```
"myapp-prod"
```

### Why it’s useful:
- Useful in templating and resource naming

---

## 13. substr(string, offset, length)

### What it does:
Extracts a substring from a given offset with a fixed length.

# Format
```
substr(string, offset, length)
```

### Example:
```hcl
substr("abcdef", 2, 3)
```

Returns:

```
"cde"
```

### Why it’s useful:
- Manipulate strings like IDs, tags, or names
