resource "aws_security_group" "ssh_sg" {
  name        = "ssh_sg"
  description = "Allow SSH connections from Everywhere"

  ingress {
    description = "Allow enter inside the ec2 from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh_sg"
  }
}


#security group -2 

resource "aws_security_group" "http_sg" {
  name        = "http_sg"
  description = "Allow http connections from Everywhere"

  ingress {
    description = "Allow http from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http_sg"
  }
}