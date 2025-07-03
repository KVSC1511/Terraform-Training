# 🚀 Terraform Training - Complete Infrastructure as Code Course

[![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)](https://aws.amazon.com/)
[![Infrastructure as Code](https://img.shields.io/badge/IaC-Infrastructure%20as%20Code-blue?style=for-the-badge)](https://www.terraform.io/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/KVSC1511/Terraform-Training?style=for-the-badge)](https://github.com/KVSC1511/Terraform-Training/stargazers)

A comprehensive, hands-on Terraform training course designed to take you from beginner to advanced Infrastructure as Code (IaC) practitioner. This repository contains practical examples, real-world scenarios, and step-by-step guides for mastering Terraform with AWS.

## 📋 Table of Contents

- [📚 Course Overview](#-course-overview)
- [🎯 Learning Objectives](#-learning-objectives)
- [🏗️ What You'll Build](#️-what-youll-build)
- [📁 Course Structure](#-course-structure)
- [🛠️ Prerequisites](#️-prerequisites)
- [🚀 Quick Start](#-quick-start)
- [📖 Course Content Details](#-course-content-details)
- [🔧 Key Features](#-key-features)
- [📋 Example Usage](#-example-usage)
- [🎓 Learning Path](#-learning-path)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)
- [🙏 Acknowledgments](#-acknowledgments)
- [📞 Support](#-support)
- [🔗 Useful Links](#-useful-links)

## 📚 Course Overview

This training is structured as a progressive learning path, covering essential Terraform concepts through hands-on practice with AWS infrastructure deployment.

### 🎯 Learning Objectives

- **Master Infrastructure as Code (IaC)** principles and best practices
- **Deploy and manage AWS infrastructure** using Terraform
- **Understand Terraform workflow** (init, plan, apply, destroy)
- **Work with variables, data sources, and outputs**
- **Implement advanced features** like count, loops, and conditional resources
- **Design and implement VPC architectures** with proper networking
- **Create reusable Terraform modules** for production environments
- **Follow security best practices** for infrastructure management

## 🏗️ What You'll Build

By the end of this course, you'll have hands-on experience building:

- **Multi-tier web applications** with EC2 instances and security groups
- **VPC architectures** with public and private subnets
- **Load balancers** and auto-scaling groups
- **Database infrastructure** with RDS instances
- **Reusable modules** for common infrastructure patterns
- **Production-ready configurations** with proper variable management

## 📁 Course Structure

### **Day 1: Foundation & Basics**
```
day-1/
├── 00-terraform-installations/     # Setup and installation guides
├── 01-Infrastructure-as-Code-IaC-Basics/  # IaC concepts and benefits
├── 02-terraform-in-action/         # Hands-on Terraform practice
└── terraform-live-writing/         # Live coding examples
```

**Topics Covered:**
- Terraform CLI installation (macOS & Windows)
- AWS CLI setup and configuration
- VS Code IDE setup with Terraform extensions
- Infrastructure as Code fundamentals
- First Terraform deployment

### **Day 2: Variables, Data Sources & Security**
```
Day-2/
├── 01-Input-Variables/             # Variable management
├── 02-Terraform-Variables-and-Datasources/  # Advanced variable usage
└── 03-Notes-about-functions/       # Terraform functions
```

**Topics Covered:**
- Input variables and their types
- Data sources for dynamic resource discovery
- Security group configuration
- Output values and resource references
- Best practices for variable management

### **Day 3: Advanced Concepts**
```
Day-3/
├── 01-Input-Variables/             # Advanced variable techniques
├── Terraform-code/                 # Practical examples
└── Terraform-Count-Loops-and-Splat/  # Loops and iteration
```

**Topics Covered:**
- Count meta-argument for resource multiplication
- Conditional resource creation
- For loops and list/map operations
- Splat expressions for resource referencing
- Advanced Terraform patterns

### **Day 4: Availability Zones & For-Each**
```
Day-4/
├── Availability-Zone/              # AZ concepts and usage
├── For-Each-Terraform/             # For-each meta-argument
├── Terraform-code/                 # Practical examples
└── README.md                       # Day 4 overview
```

**Topics Covered:**
- Availability Zone concepts and best practices
- For-each meta-argument for dynamic resource creation
- Advanced resource iteration patterns
- Multi-AZ infrastructure deployment

### **Day 5: VPC & Terraform Modules**
```
Day-5/
├── 01-VPC-INFO/                    # VPC fundamentals and concepts
├── 02-AWS-VPC-using-Mgmt-Console/  # Manual VPC creation
└── 03-Terraform-Modules/           # Module concepts and usage
```

**Topics Covered:**
- VPC fundamentals and networking concepts
- Subnet, Route Table, and CIDR block management
- Internet Gateway and NAT Gateway configuration
- Terraform module basics and best practices
- Module structure and reusability

### **Day 6: Advanced Modules & Functions**
```
Day-6/
├── 01-Terraform-Modules_Notes/     # Advanced module concepts
├── 02-Vpc-With_Module_Code/        # VPC module implementation
├── 03-Locals-tfvars/               # Local values and tfvars
└── 04-Terraform-Functions/         # Built-in Terraform functions
```

**Topics Covered:**
- Advanced module patterns and best practices
- VPC module implementation with Terraform
- Local values and variable files (tfvars)
- Terraform built-in functions and expressions
- Production-ready module development

### **Day 7: Advanced Networking, Bastion & Provisioners**
```
Day-7/
├── 00-Newtworking-Notes/           # Networking concepts, public/private subnets, Bastion host
├── 01-Vpc-With_Module_Code/        # VPC with modules, Bastion, EC2, security groups, user data
├── 02-null-resource/               # null_resource, provisioners, local-exec, remote-exec
└── 03-depends_on_and_Bastion/      # depends_on meta-argument, Bastion host use cases
```

**Topics Covered:**
- Public and private subnet design, Bastion host concepts (with analogies)
- VPC implementation using modules, Bastion and private EC2 setup, user data scripts
- Terraform `null_resource`, provisioners (`local-exec`, `remote-exec`), file uploads, and best practices
- Explicit resource dependencies with `depends_on`
- Secure access patterns for private infrastructure

## 🛠️ Prerequisites

Before starting this course, ensure you have:

- **AWS Account** with appropriate permissions
- **Terraform CLI** (version 1.0+ recommended)
- **AWS CLI** configured with credentials
- **VS Code** with Terraform extension
- **Basic understanding** of AWS services (EC2, VPC, Security Groups)

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/KVSC1511/Terraform-Training.git
cd Terraform-Training
```

### 2. Install Prerequisites
Follow the installation guides in `day-1/00-terraform-installations/README.md` for:
- [Terraform CLI Installation](day-1/00-terraform-installations/README.md)
- [AWS CLI Setup](day-1/00-terraform-installations/README.md)
- [VS Code Configuration](day-1/00-terraform-installations/README.md)

### 3. Configure AWS Credentials
```bash
aws configure
```

### 4. Start Learning
Begin with Day 1 and progress through each module sequentially.

## 📖 Course Content Details

### Day 1: Foundation
- **Terraform Installation**: Complete setup for macOS and Windows
- **IaC Basics**: Understanding the problems Terraform solves
- **First Deployment**: Deploy your first EC2 instance
- **Live Examples**: Real-time infrastructure creation

### Day 2: Core Concepts
- **Variables**: Input, local, and output variables
- **Data Sources**: Dynamic resource discovery
- **Security Groups**: Network security configuration
- **Best Practices**: Code organization and structure

### Day 3: Advanced Features
- **Count & Loops**: Resource multiplication and iteration
- **Conditional Logic**: Dynamic resource creation
- **Splat Expressions**: Efficient resource referencing
- **Advanced Patterns**: Production-ready configurations

### Day 4: Availability Zones & For-Each
- **Availability Zones**: Multi-AZ infrastructure concepts
- **For-Each Meta-Argument**: Dynamic resource creation
- **Advanced Iteration**: Complex resource patterns
- **High Availability**: Production-ready infrastructure

### Day 5: VPC & Modules
- **VPC Fundamentals**: Networking concepts and design
- **Manual VPC Creation**: AWS Console hands-on practice
- **Terraform Modules**: Code reusability and organization
- **Module Best Practices**: Industry-standard patterns

### Day 6: Advanced Modules & Functions
- **Advanced Modules**: Complex module patterns
- **VPC Module Implementation**: Real-world module development
- **Local Values & tfvars**: Advanced variable management
- **Terraform Functions**: Built-in functions and expressions

### Day 7: Advanced Networking, Bastion & Provisioners
- **Networking Concepts**: Public/private subnets, Bastion host, security group mapping
- **VPC with Modules**: Modular VPC, Bastion, EC2, user data automation
- **Provisioners & null_resource**: `local-exec`, `remote-exec`, file uploads, triggers
- **depends_on**: Explicit resource dependencies and orchestration
- **Best Practices**: Secure access, production patterns

## 🔧 Key Features

- **Hands-on Practice**: Every concept includes working examples
- **Real AWS Resources**: Deploy actual infrastructure
- **Progressive Learning**: Build complexity gradually
- **Best Practices**: Industry-standard patterns and conventions
- **Security Focus**: Secure infrastructure deployment
- **Cross-Platform**: Works on macOS, Windows, and Linux
- **Production-Ready**: Real-world scenarios and configurations

## 📋 Example Usage

### Basic EC2 Instance Deployment
```hcl
# Example from Day 2
resource "aws_instance" "myec2vm" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.ssh-sg.id, aws_security_group.web-sg.id]
  
  tags = {
    Name = "EC2 Demo"
  }
}
```

### Multiple Resources with Count
```hcl
# Example from Day 3
resource "aws_instance" "web" {
  count         = 3
  ami           = data.aws_ami.amzlinux2.id
  instance_type = "t3.micro"
  
  tags = {
    Name = "web-instance-${count.index}"
  }
}
```

### VPC Module Usage
```hcl
# Example from Day 6
module "vpc" {
  source = "./modules/vpc"
  
  vpc_cidr = "10.0.0.0/16"
  environment = "production"
  
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}
```

## 🎓 Learning Path

### **Week 1: Foundation & Core Concepts**
1. **Day 1**: Terraform basics and first deployment
2. **Day 2**: Variables, data sources, and security
3. **Day 3**: Advanced patterns with count and loops

### **Week 2: Advanced Infrastructure**
4. **Day 4**: Multi-AZ deployments and for-each
5. **Day 5**: VPC design and module basics
6. **Day 6**: Advanced modules and production patterns

### **Week 3: Advanced Networking & Provisioning**
7. **Day 7**: Advanced networking, Bastion, and provisioners

### **Skill Progression**
- **Beginner** (Day 1-2): Basic Terraform concepts and simple deployments
- **Intermediate** (Day 3-4): Advanced patterns and multi-resource management
- **Advanced** (Day 5-7): Complex architectures and production-ready modules

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### How to Contribute
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- HashiCorp for creating Terraform
- AWS for providing the cloud platform
- The open-source community for continuous improvements
- All contributors who help improve this training material

## 📞 Support

If you encounter any issues or have questions:

1. Check the existing issues in this repository
2. Create a new issue with detailed information
3. Review the Terraform documentation: [https://www.terraform.io/docs](https://www.terraform.io/docs)

## 🔗 Useful Links

- [Terraform Official Documentation](https://www.terraform.io/docs)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)
- [HashiCorp Learn](https://learn.hashicorp.com/terraform)
- [Terraform Registry](https://registry.terraform.io/)

---

**Happy Learning! 🎉**

*Start your Infrastructure as Code journey with this comprehensive Terraform training course.* 