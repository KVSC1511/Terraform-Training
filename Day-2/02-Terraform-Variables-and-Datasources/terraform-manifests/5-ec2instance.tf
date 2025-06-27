# EC2 Instance
resource "aws_instance" "myec2vm" {

  ami                       = data.aws_ami.amzlinux2.id
  instance_type             = var.env_instance_type[var.env]
  key_name                  = var.instance_keypair
  availability_zone         = var.availability_zones[0]
  monitoring                = var.enable_monitoring
  user_data                 = file("${path.module}/app1-install.sh")
  vpc_security_group_ids    = [ aws_security_group.ssh-sg.id, aws_security_group.web-sg.id]

  tags = {
    Name       = var.app_metadata[0]
  }
}




// # EC2 Instance
// resource "aws_instance" "myec2vm" {

//   ami                       = data.aws_ami.amzlinux2.id
//   instance_type             = "t3.micro"
//   key_name                  = "training-key"
//   availability_zone         = "us-east-1a"
//   monitoring                = false
//   user_data                 = file("${path.module}/app1-install.sh")
//   vpc_security_group_ids    = [ aws_security_group.ssh-sg.id, aws_security_group.web-sg.id]

//   tags = {
//     Name       = "webapp"
//   }
// }