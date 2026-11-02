# AWS Terraform modules

This configuration creates an EC2 instance, a private encrypted S3 bucket, and an IAM role with an EC2 instance profile.

## Layout

```text
.
├── main.tf                     # Root provider, locals, and module calls
├── variables.tf                # Root input variables
├── outputs.tf                  # Root outputs
├── modules/
│   ├── ec2/                    # EC2 module
│   ├── s3/                     # S3 module
│   └── iam/                    # IAM role and instance-profile module
└── .github/workflows/terraform.yml
```

Each module has `main.tf`, `variables.tf`, and `outputs.tf`.

## Use

1. Create your local variables file:

   ```sh
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Replace the placeholder AMI, subnet, security-group, and globally unique bucket values in `terraform.tfvars`.

3. Authenticate the AWS CLI or export AWS credentials, then run:

   ```sh
   terraform init
   terraform plan
   terraform apply
   ```

The S3 bucket blocks all public access and enables AES-256 server-side encryption. It is not deleted while non-empty unless `s3_force_destroy = true` is explicitly set.
