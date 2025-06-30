resource "aws_instance" "web" {
  for_each        = var.ec2_config
  ami             = each.value.ami
  instance_type   = each.value.instance_type
  key_name        = var.key_name
  vpc_security_group_ids  = [aws_security_group.ssh_sg.id,aws_security_group.http_sg.id]
  user_data       = file("${path.module}/app1.sh")

  tags = {
    Name = "${each.key}"
  }
}

data "aws_availability_zones" "example" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

output "a_zone_information" {
  value = data.aws_availability_zones.example.names
}





#webserver-1, webserver-2 ...

# I wanted to create an ec2 instance in each availability zone in that region


# I wanted to create 2 ec2 instances one for dev environment and another for in prod environment
# In dev i wanted to have amazon linux instance with t2.micro
# in Prod I wanted to have an ubuntu machine with t3.micro
#dev shpuld have dev-server and prod-server

# meta arguments - count , for_each
