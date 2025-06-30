# AWS Availability Zones (AZs)

---

## 🔹 What is an Availability Zone (AZ) in AWS?

An **Availability Zone (AZ)** is a **physically isolated data center or group of data centers** within an AWS **Region**, designed to provide **fault tolerance, high availability, and scalability**.

Each AZ:

- Has its **own power, cooling, and networking infrastructure**.
- Is **separate from other AZs**, so a failure in one won’t affect the others.
- Is connected to other AZs in the same region using **low-latency, high-speed fiber links**.

---

## 🔹 Key Characteristics of AZs

1. **Physical Isolation**  
   Each AZ is in a different location (separate buildings or campuses), reducing the risk of simultaneous failures.

2. **Redundancy**  
   You can run your applications in multiple AZs to ensure high availability. If one AZ fails, traffic can shift to another AZ automatically.

3. **EC2 Service Use AZs**
   - EC2 lets you launch instances in a specific AZ.

---

## 🔹 Region vs AZ

| **Term**   | **Definition**                                                                                        |
| ---------- | ----------------------------------------------------------------------------------------------------- |
| **Region** | A geographical location (e.g., `us-east-1`, `ap-south-1`) where AWS has infrastructure.               |
| **AZ**     | A logical subdivision within a Region, representing an isolated data center or group of data centers. |

Each region has **at least 2 AZs**, and some regions have up to 6.

---

## 🔹 How to Find Number of AZs in a Region

### ✅ Using AWS CLI

```bash
aws ec2 describe-availability-zones --region ap-south-1 --query "AvailabilityZones[*].ZoneName"
```

### ✅ Using AWS Console

1. Open the **EC2 Dashboard**.
2. On the left, click **"Availability Zones"** under **Account Attributes**.
3. You’ll see the list of AZs available in your selected region.

---

## 🔹 Why Use Multiple AZs?

- **High Availability**: If one AZ goes down, your app in other AZs stays online.
- **Fault Tolerance**: Protects against data center-level failures.
- **Disaster Recovery**: Helps in minimizing impact of regional outages.
