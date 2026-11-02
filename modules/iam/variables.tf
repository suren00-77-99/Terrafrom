variable "role_name" {
  description = "Name of the IAM role created for EC2."
  type        = string
}

variable "common_tags" {
  description = "Tags applied to the IAM role."
  type        = map(string)
  default     = {}
}
