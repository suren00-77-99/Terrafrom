variable "bucket_name" {
  description = "Globally unique name of the S3 bucket."
  type        = string
}

variable "force_destroy" {
  description = "Whether Terraform may delete a non-empty bucket."
  type        = bool
  default     = false
}

variable "common_tags" {
  description = "Tags applied to the S3 bucket."
  type        = map(string)
  default     = {}
}
