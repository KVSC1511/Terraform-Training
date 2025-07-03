# Understanding Public and Private Subnets with Bastion Host in AWS

This guide explains the concept of **public subnets**, **private subnets**, and the use of a **Bastion Host**, using both **technical definitions** and a **gated community analogy** for better understanding.

---

## Technical Definitions

### 1. VPC (Virtual Private Cloud)
A logically isolated network within AWS that lets you launch AWS resources in a custom IP range.

### 2. Public Subnet
- A subnet whose **route table is connected to an Internet Gateway (IGW)**.
- Instances in this subnet can be accessed from the internet (if public IP is assigned).

### 3. Private Subnet
- A subnet with **no direct route to the Internet Gateway**.
- Instances here are not accessible from the internet directly.

### 4. Bastion Host (Jump Box)
- A secure instance in a **public subnet** used to **SSH into private instances**.
- Acts as a gateway between external users and private resources.

### 5. Security Groups
- Virtual firewalls that control **inbound and outbound traffic** to your instances.
- Should be designed carefully to enforce access control.

---

## Gated Community Analogy

### 1. VPC = The Gated Community
Represents the boundary wall of a secure society. Everything inside is protected, and entry is restricted.

---

### 2. Public Subnet = Reception/Security Gate Area
This is the **security checkpoint** of the community:
- It is **accessible to visitors** from the outside (Internet).
- Here, you install a **security kiosk** – the **Bastion Host**.
  - It has a **public phone line** (Elastic IP) and allows entry only for valid visitors (SSH users).
  - Think of this like calling the security to let you into the gated community.

**Security Group for Bastion:**
- Open to the world on port **22** (SSH) – but only for users with the correct key.
- "Security guard allows you in only via **phone (port 22)** and only if you know the secret code (SSH key)."

---

### 3. Private Subnet = Residential Villas
This is where the **residents (private EC2 instances)** live.
- They have **no direct access** to the public.
- If someone wants to visit, they must **go through the security gate (bastion)** first.

**Security Group for Private EC2s:**
- Port **22 (SSH)** open **only to the Bastion's security group/IP**.
- Port **80 (HTTP)** open only **to public subnets/ALBs**, if needed.

Example: "The web server in the villa only allows known visitors coming from the reception to dine in."

---

### 4. Internet Gateway = Main Gate of the Community
- **Public subnet** has access to the internet via this **main gate**.
- **Private subnet** doesn’t have access unless you set up **NAT** or **go through Bastion**.

---

## Security Group Mapping (Summary Table)

| Component      | Analogy                   | Security Group Rule Description                            |
| -------------- | ------------------------- | ---------------------------------------------------------- |
| Bastion Host   | Security Checkpoint Kiosk | Allow port 22 from `0.0.0.0/0` (restricted by SSH key)     |
| Private EC2    | Private Villas            | Allow port 22 from Bastion SG only, port 80 from public SG |

---

## Key Points for Trainees

- Do not assign public IPs to private EC2s.
- Bastion Host should be in **public subnet** with public IP.
- Never open SSH on private EC2s to the world.
- Use Bastion as a **controlled access point**.
- Logs, monitoring, and MFA on Bastion are critical for production setups.

---

## Optional Enhancements

- Use Session Manager (SSM) instead of Bastion for better audit and control.
- Use Terraform modules to abstract this pattern for reusability across environments.
