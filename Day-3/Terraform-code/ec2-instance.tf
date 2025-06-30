resource "aws_instance" "web" {
  count           = 3
  ami             = data.aws_ami.amzlinux2.id
  instance_type   = var.instance_type_map["dev"]
  key_name        = var.key_name
  vpc_security_group_ids  = [aws_security_group.ssh_sg.id,aws_security_group.http_sg.id]
  user_data       = file("${path.module}/app1.sh")

  tags = {
    Name = "webserver-${count.index + 1}"
  }
}






