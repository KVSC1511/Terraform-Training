#these are examples of string variables

variable "instance_type" {
    type = string
    description = "the instance type we are choosing to create EC2"
    default = "t3.micro"
}

variable "key_name" {
    type = string
    description = "the key pair that we are using for Ec2"
    default = "terraform-training-key"
}

#this is an example for number type variable

variable "ssh_port" {
    type = number
    description = "ssh-port"
    default = 22
}

#this is an example for list(strings) type variable

variable "cidr_block" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}


#this is an example for map(strings) type variable

variable "instance_type_map" {
  type = map(string)
  default = {
    "dev" = "t3.micro"
    "prod" = "t3.large"
  }
}


#map(object)

variable "ec2_config" {
  type = map(object({
    ami = string
    instance_type = string
  }))
  description = "this is a map(object) variable containing ec2 configuration"
  default = {
    "dev-server" = {
      ami = "ami-05ffe3c48a9991133"
      instance_type = "t2.micro"
    }
    "prod-server" = {
      ami = "ami-020cba7c55df1f615"
      instance_type = "t3.micro"
    }
  }
}

