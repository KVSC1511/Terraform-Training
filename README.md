# 🚀 Terraform Training - Complete Infrastructure as Code Course

[![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)](https://aws.amazon.com/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A comprehensive, hands-on Terraform training course designed to take you from beginner to advanced Infrastructure as Code (IaC) practitioner. This repository contains practical examples, real-world scenarios, and step-by-step guides for mastering Terraform with AWS.

## 📚 Course Overview

This training is structured as a progressive learning path, covering essential Terraform concepts through hands-on practice with AWS infrastructure deployment.

### 🎯 Learning Objectives

- **Master Infrastructure as Code (IaC)** principles and best practices
- **Deploy and manage AWS infrastructure** using Terraform
- **Understand Terraform workflow** (init, plan, apply, destroy)
- **Work with variables, data sources, and outputs**
- **Implement advanced features** like count, loops, and conditional resources
- **Follow security best practices** for infrastructure management

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

## 🔧 Key Features

- **Hands-on Practice**: Every concept includes working examples
- **Real AWS Resources**: Deploy actual infrastructure
- **Progressive Learning**: Build complexity gradually
- **Best Practices**: Industry-standard patterns and conventions
- **Security Focus**: Secure infrastructure deployment
- **Cross-Platform**: Works on macOS, Windows, and Linux

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

## 🎓 Learning Path

1. **Beginner**: Start with Day 1 modules
2. **Intermediate**: Progress through Day 2 concepts
3. **Advanced**: Master Day 3 advanced features
4. **Practice**: Work through all examples and exercises

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- HashiCorp for creating Terraform
- AWS for providing the cloud platform
- The open-source community for continuous improvements

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

---

**Happy Learning! 🎉**

*Start your Infrastructure as Code journey with this comprehensive Terraform training course.* 