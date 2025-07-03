
# Terraform `depends_on`, Bastion Host: Concepts and Use Cases

---

## 1. What is `depends_on` in Terraform?

### Definition
`depends_on` is a **meta-argument** used in Terraform to create **explicit dependencies** between resources. It ensures that one resource is created **only after** the specified dependent resources are fully provisioned.

### Why Use It?
Terraform usually detects resource dependencies automatically through interpolation. However, in some cases — such as with `null_resource` or `provisioner` blocks — you must **manually specify** the dependency using `depends_on`.

### Syntax Example

```hcl
resource "null_resource" "remote_script" {
  depends_on = [aws_instance.bastion]

  provisioner "remote-exec" {
    inline = ["echo 'Running post-deployment script'"]
    connection {
      host        = aws_instance.bastion.public_ip
      user        = "ec2-user"
      private_key = file("~/.ssh/my-key.pem")
      type        = "ssh"
    }
  }
}
```

In this case, the null resource will wait until the `bastion` EC2 instance is created before it executes the script.

---

## 2. What is a Bastion Host?

### Definition
A **Bastion Host** (also known as a jump box) is a **special-purpose EC2 instance** used to securely connect to private resources (like private EC2 instances or RDS databases) inside a VPC that are **not publicly accessible**.

### Key Characteristics
- Publicly accessible EC2 instance
- Has SSH access enabled (typically port 22)
- Acts as a gateway to access other private servers
- Placed in the **public subnet**
- Other instances are in **private subnets**, and only allow inbound SSH from the Bastion

---

## 3. Why Bastion Hosts Are Used

### Purpose
- **Security**: Reduces the attack surface. Only one machine (Bastion) is exposed to the internet.
- **Access Control**: Centralized access point for administrative tasks.
- **Audit**: You can log all SSH access via the bastion for compliance and monitoring.
- **No direct public IPs** on private instances

### Real-World Use Case

You deploy:
- Bastion Host in public subnet: `10.0.0.10` (public IP attached)
- Private EC2 app server in private subnet: `10.0.1.10`

You SSH to Bastion:
```bash
ssh -i key.pem ec2-user@<bastion-public-ip>
```

Then jump to private EC2:
```bash
ssh -i key.pem ec2-user@10.0.1.10
```

The private EC2 is protected from the internet and only accessible through the Bastion.

---

## Summary

| Concept      | Explanation |
|--------------|-------------|
| depends_on   | Ensures resource creation order |
| Bastion Host | Secure entry point to private infra |
| Purpose      | SSH access to private servers via a single controlled public endpoint |

---

