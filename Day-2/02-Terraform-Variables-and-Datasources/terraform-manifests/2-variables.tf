########################################
# Input Variables
########################################

# AWS Region ---------------------------> String
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}

# AWS EC2 Instance Key Pair ------------> String
variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type        = string
  default     = "training-key"
}

# Environment --------------------------> String (used for map lookup)
variable "env" {
  description = "Environment to choose instance type from map"
  type        = string
  default     = "dev" 
}

# EC2 Instance Count -------------------> Number
variable "instance_count" {
  description = "How many instances to be created"
  type        = number
  default     = 1
}

# Availability Zones -------------------> List(String)
variable "availability_zones" {
  description = "List of Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# Application Metadata -----------------> Tuple
variable "app_metadata" {
  description = "App name, version, and feature enabled flag"
  type        = tuple([string, number, bool])
  default     = ["webapp", 1, true]
}

# Enable Monitoring --------------------> Bool
variable "enable_monitoring" {
  description = "Toggle for monitoring"
  type        = bool
  default     = false
}

# Environment Instance Types -----------> Map(String)
variable "env_instance_type" {
  description = "Map of instance types per environment"
  type        = map(string)
  default = {
    dev  = "t3.micro"
    prod = "t3.large"
  }
}
