# I want to create an ec2 instance in each availability zone
# I want to create a amazon linux in dev-server and ubuntu in prod-server, also the names should eb dev-server and prod-server

data "aws_availability_zones" "example" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# output "az_output" {
#   value = data.aws_availability_zones.example.names
  
# }

variable "ec_config" {
  type = map(object({
    ami = string
    instance_type = string
  }))
  default = {
    "frontend" = {
      ami = "ami-05ffe3c48a9991133"
      instance_type = "t2.micro"
    }
    "backend" = {
      ami = "ami-020cba7c55df1f615"
      instance_type = "t3.micro"
    }
  }
}

resource "aws_instance" "web" {
  for_each        = var.ec_config
  ami             = each.value.ami
  instance_type   = each.value.instance_type
  key_name        = var.key_name
  vpc_security_group_ids  = [aws_security_group.ssh_sg.id,aws_security_group.http_sg.id]
  user_data       = file("${path.module}/app1.sh")

  tags = {
    Name = "${each.key}"
  }
}
