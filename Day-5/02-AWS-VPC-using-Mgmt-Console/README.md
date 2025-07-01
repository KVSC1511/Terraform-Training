# Design AWS VPC using AWS Management Console

## Step-01: Introduction
- Create VPC
- Create Public and Private Subnets
- Create Internet Gateway and Associate to VPC
- Create NAT Gateway in Public Subnet
- Create Public Route Table, Add Public Route via Internet Gateway and Associate Public Subnet
- Create Private Route Table, Add Private Route via NAT Gateway and Associate Private Subnet

## Step-02: Create VPC
- **Name:** demo-manual-vpc
- **IPv4 CIDR Block:** 10.0.0.0/16
- Rest all defaults
- Click on **Create VPC**

## Step-03: Create Subnets
### Step-03-01: Public Subnet
- **VPC ID:** demo-manual-vpc
- **Subnet Name::** demo-public-subnet-1
- **Availability zone:** us-east-1a
- **IPv4 CIDR Block:** 10.0.1.0/24

### Step-03-02: Private Subnet
- **Subnet Name::** demo-private-subnet-1
- **Availability zone:** us-east-1a
- **IPv4 CIDR Block:** 10.0.2.0/24
- Click on **Create Subnet**

## Step-04: Create Internet Gateway and Associate it to VPC
- **Name Tag:** demo-igw
- Click on **Create Internet Gateway**
- Click on Actions -> Attach to VPC -> demo-manual-vpc

## Step-05: Create NAT Gateway
- **Name:** demo-nat-gateway
- **Subnet:** demo-public-subnet-1
- **Allocate Elastic Ip:** click on that
- Click on **Create NAT Gateway**

## Step-06: Create Public Route Table and Create Routes and Associate Subnets
### Step-06-01: Create Public Route Table
- **Name tag:** demo-public-route-table
- **vpc:** demo-manual-vpc
- Click on **Create**
### Step-06-02: Create Public Route in newly created Route Table
- Click on **Add Route**
- **Destination:** 0.0.0.0/0
- **Target:** demo-igw
- Click on **Save Route**
### Step-06-03: Associate Public Subnet 1 in Route Table
- Click on **Edit Subnet Associations**
- Select **demo-public-subnet-1**
- Click on **Save**


## Step-07: Create Private Route Table and Create Routes and Associate Subnets
### Step-07-01: Create Private Route Table
- **Name tag:** demo-private-route-table
- **vpc:** demo-manual-vpc
- Click on **Create**
### Step-07-02: Create Private Route in newly created Route Table
- Click on **Add Route**
- **Destination:** 0.0.0.0/0
- **Target:** demo-nat-gateway
- Click on **Save Route**
### Step-07-03: Associate Private Subnet 1 in Route Table
- Click on **Edit Subnet Associations**
- Select **demo-private-subnet-1**
- Click on **Save**

## Step-08: Clean-Up
- Delete `demo-nat-gateway`
- Wait till NAT Gateway is deleted
- Delete `demo-manual-vpc`


