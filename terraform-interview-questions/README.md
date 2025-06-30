#  Terraform Interview Questions and Answers (Beginner Level)

This document contains beginner-friendly Terraform interview questions based only on the topics covered so far.

---

##  Terraform Basics

### 1. What is the significance of the `provider` block in Terraform?

**Answer:**  
The `provider` block tells Terraform which cloud platform to use, like AWS or Azure. It also contains required details like region or credentials. Without this block, Terraform doesn’t know where to create resources.

---

### 2. What is the `required_version` in the `terraform` block?

**Answer:**  
The `required_version` ensures that Terraform runs only with a specific version or range of versions. This helps avoid compatibility issues across team members or CI/CD pipelines.

```hcl
terraform {
  required_version = ">= 1.3.0"
}
```

---

### 3. What is the significance of the Terraform state file?

**Answer:**  
The Terraform state file (`terraform.tfstate`) keeps a record of all the resources Terraform manages. It helps Terraform understand what is already created so it can plan updates without recreating everything.

---

### 4. Where does Terraform store the downloaded provider plugin?

**Answer:**  
Terraform stores downloaded providers in a hidden directory called `.terraform` inside your working directory. This helps reuse the same provider across runs.

---

### 5. How does Terraform keep track of the resources it has already created?

**Answer:**  
Terraform keeps track using the state file. This file maps resource definitions in your code to real-world infrastructure. When you run `terraform apply`, it compares the current state to the desired configuration.

---

##  Resource vs Data Handling

### 6. What is the difference between a `resource` block and a `data` block in Terraform?

**Answer:**  
- `resource` block is used to create or manage infrastructure.
- `data` block is used to read existing resources without creating anything new.

---

### 7. What is a `data` block in Terraform? When would you use it?

**Answer:**  
A `data` block is used when you want to fetch or reference existing infrastructure. For example, getting the latest Amazon Linux AMI ID instead of hardcoding it.

---

### 8. What is the difference between arguments and attributes in Terraform?

**Answer:**  
- **Arguments** are inputs you define in the Terraform code (e.g., `ami`, `instance_type`).
- **Attributes** are the outputs or computed values Terraform provides after a resource is created (e.g., `id`, `public_ip`).

---

##  Meta-Arguments and Resource Creation

### 9. What are meta-arguments in Terraform?

**Answer:**  
Meta-arguments are special keywords you can use in resource blocks to control behavior. Common meta-arguments include `count`, `for_each`, `provider`, and `depends_on`.

---

### 10. How is the `count` meta-argument used in Terraform?

**Answer:**  
The `count` meta-argument is used to create multiple instances of a resource using a single block. You can specify how many to create dynamically.

```hcl
resource "aws_instance" "web" {
  count         = 3
  ami           = "ami-xyz"
  instance_type = "t3.micro"
}
```

You can also use `count.index` to create unique names:

```hcl
resource "aws_s3_bucket" "example" {
  count  = 3
  bucket = "my-bucket-${count.index}"
}
```

---

### 11. How can you use one resource block to create multiple S3 buckets with unique names?

**Answer:**  
You can use `for_each` or `count` to loop over names and create multiple buckets.

**Using `for_each`:**
```hcl
resource "aws_s3_bucket" "buckets" {
  for_each = toset(["bucket-one", "bucket-two", "bucket-three"])
  bucket   = each.key
}
```

---

##  Terraform Runtime Behavior

### 12. If an EC2 instance created by Terraform is deleted manually, what happens when you run `terraform apply` again?

**Answer:**  
Terraform will detect that the EC2 instance is missing and will recreate it automatically to match the desired state in your configuration.

---

### 13. What is the `.terraform.lock.hcl` file used for?

**Answer:**  
This lock file records the exact provider versions used, ensuring consistent behavior across environments and team members.

---

### 14. What happens if you change the `instance_type` of an EC2 instance in your Terraform code?

**Answer:**  
Terraform will mark the existing instance for destruction and create a new one with the updated instance type, as some properties can't be changed in-place.

---

### 15. Can `count` and `for_each` be used together?

**Answer:**  
No. A resource block can use either `count` or `for_each`, but not both at the same time.

---

### 16. What is the use of `terraform init`?

**Answer:**  
`terraform init` initializes the working directory. It downloads the necessary provider plugins and sets up the backend if configured. It's the first command to run before planning or applying Terraform code.

---

### 17. What does `terraform plan` do?

**Answer:**  
`terraform plan` shows what actions Terraform will take to reach the desired state. It compares the current state with the configuration and shows what will be added, changed, or destroyed.

---

### 18. What is the purpose of `terraform validate`?

**Answer:**  
`terraform validate` checks whether your configuration is syntactically valid. It doesn't access remote services but verifies the structure of the files.

---

### 19. Can you explain the role of `output` in Terraform?

**Answer:**  
The `output` block is used to display useful information after Terraform execution. For example, it can show public IPs, resource IDs, or DNS names of the created resources.

```hcl
output "instance_ip" {
  value = aws_instance.web.public_ip
}
```

---

### 20. What is `terraform destroy` used for?

**Answer:**  
`terraform destroy` is used to remove all infrastructure managed by Terraform. It reads the state file and deletes all the resources defined in the configuration.

---