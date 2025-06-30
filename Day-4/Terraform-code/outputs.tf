# output "instance_ip_1" {
#   value = aws_instance.web[0].public_ip
# }

# output "instance_ip_2" {
#   value = aws_instance.web[1].public_ip
# }

# output "instance_ip_3" {
#   value = aws_instance.web[2].public_ip
# }


# for loop output

# output "public_ip_of_all_three_instances" {
  
#   value = [for i in aws_instance.web: i.public_ip]
# }


# output "map_of_three_ips" {
#     value = {for i in aws_instance.web: i.tags["Name"] => i.public_ip}
# }


#This splat operator works only along with count

output "instance_ips" {
    value = [for i in aws_instance.web: i.public_ip]
  
}