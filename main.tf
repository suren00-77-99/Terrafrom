terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  common_tags = merge(
    {
      ManagedBy   = "Terraform"
      Environment = var.environment
      Project     = var.project_name
    },
    var.additional_tags
  )
}

module "iam" {
  source = "./modules/iam"

  role_name   = "${var.project_name}-${var.environment}-ec2-role"
  common_tags = local.common_tags
}

module "s3" {
  source = "./modules/s3"

  bucket_name   = var.bucket_name
  force_destroy = var.s3_force_destroy
  common_tags   = local.common_tags
}

module "ec2" {
  source = "./modules/ec2"

  instance_name        = "${var.project_name}-${var.environment}-ec2"
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = var.subnet_id
  security_group_ids   = var.security_group_ids
  iam_instance_profile = module.iam.instance_profile_name
  common_tags          = local.common_tags
}
