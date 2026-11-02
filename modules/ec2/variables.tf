variable "instance_name" {
  description = "Name tag for the EC2 instance."
  type        = string
}

variable "ami_id" {
  description = "AMI ID used to launch the instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the instance."
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs for the instance."
  type        = list(string)
}

variable "iam_instance_profile" {
  description = "IAM instance profile name to associate with the instance."
  type        = string
}

variable "common_tags" {
  description = "Tags applied to the EC2 instance."
  type        = map(string)
  default     = {}
}
