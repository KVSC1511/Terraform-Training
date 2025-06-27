# Terraform Settings Block
terraform {
  required_version = "~>1.12.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}
#Terraform Provider Block

provider "aws" {
  profile = "terraform-training"
  region  = "us-east-1"

}

#resource Block

resource "aws_instance" "ec2demo" {

  count = 2
  ami           = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
  tags = {
    Name = "ec2-from-terraform"
  }
}


#output Blocks

# output "instance_arn" {
#   value = aws_instance.ec2demo.public_ip
# }
