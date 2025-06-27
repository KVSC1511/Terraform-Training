# Terraform Block
terraform {
  required_version = ">= 1.12.2" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "terraform-training"
}
