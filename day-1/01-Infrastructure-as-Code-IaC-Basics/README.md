#  Infrastructure as Code (IaC) Basics with Terraform

##  Step‑01: Traditional Way of Managing Infrastructure – What's the Problem?

Before Terraform or any IaC tool, most teams used **manual processes** to manage their infrastructure.

###  Challenges in Traditional Approach

- **Time‑consuming to set up environments**  
  *Example:* If you want to set up **DEV**, **QA**, and **PROD** environments, someone has to manually create EC2s, VPCs, RDS, etc., one by one.  
  *Result:* Takes **hours or days** and may introduce **inconsistencies**.

- **Environments behave differently**  
  *Example:* **DEV** might have `t2.micro` EC2s, **QA** might have `t3.medium`, **PROD** might have proper security but **QA** doesn't.  
  *Result:* “It works in DEV, but fails in PROD!” is a common issue.

- **Hard to Scale**  
  If you get more traffic and need to scale up, you must manually go to the AWS console and increase instance count or size.  
  *Result:* Slow and error‑prone.

---

##  Step‑02: How Terraform (IaC) Solves These Problems

Terraform lets you **define infrastructure in code** — using a `.tf` file — and **automate** it.

###  Benefits

#### Visibility
- Code tells you *exactly* what’s being created (e.g., 2 EC2s, 1 VPC, 1 RDS).
- You can review and version‑control everything using Git.

```hcl
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```

#### Stability
- Same code = Same infra across all environments (**DEV**, **QA**, **PROD**).
- No “Oops, I forgot to enable encryption in QA!”

*Example:* Use one `main.tf`, and variables to switch regions or instance types for each environment.

#### Scalability
- Change one line in code to increase instances from **2** to **10**.
- Terraform applies it automatically.

```hcl
count = 10
```

#### Audit
- Every infrastructure change is stored in Git history.
- Easy to track *who changed what*, *when*, and *why*.
