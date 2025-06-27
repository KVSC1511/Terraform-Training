# Terraform Output Values

# EC2 Instance Public IP
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value = aws_instance.myec2vm.public_ip
}

# EC2 Instance Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value = aws_instance.myec2vm.public_dns
}

#APP URL
output "app_url" {
  description = "EC2 Application URL"
  value       = "http://${aws_instance.myec2vm.public_ip}/app/index.html"
}


output "primary_az" {
  value = var.availability_zones[0]
}

output "app_name" {
  value = var.app_metadata[0]
}

output "monitoring_status" {
  value = var.enable_monitoring ? "Monitoring enabled" : "Monitoring disabled"
}

