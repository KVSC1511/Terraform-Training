# AMI Filtering Datasource
data "aws_ami" "amzlinux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# Availability Zone fetching Datasource
data "aws_availability_zones" "a_zones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}