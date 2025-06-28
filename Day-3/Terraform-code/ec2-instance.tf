resource "aws_instance" "web" {
  ami             = data.aws_ami.amzlinux2.id
  instance_type   = "t3.micro"
  key_name        = "terraform-training-key"
  vpc_security_group_ids  = [aws_security_group.ssh_sg.id,aws_security_group.http_sg.id]
  user_data       = file("${path.module}/app1.sh")

  tags = {
    Name = "webserver"
  }
}