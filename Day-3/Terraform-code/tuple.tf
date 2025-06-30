variable "app_metadata" {
  type        = tuple([string, number, bool])
  description = "App name, version, and feature flag"
  default     = ["frontend", 1, true]
}

output "app_name" {
  value = var.app_metadata[0]
}