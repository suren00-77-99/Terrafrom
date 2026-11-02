output "ec2_instance_id" {
  description = "ID of the EC2 instance."
  value       = module.ec2.instance_id
}

output "ec2_public_ip" {
  description = "Public IPv4 address of the EC2 instance, if one is assigned by the subnet."
  value       = module.ec2.public_ip
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket."
  value       = module.s3.bucket_name
}

output "iam_role_arn" {
  description = "ARN of the EC2 IAM role."
  value       = module.iam.role_arn
}
