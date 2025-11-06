# Terraform Infrastructure

Infrastructure-as-Code for AWS environments using Terraform + Terragrunt overlays.

## Layout

- `envs/` – Environment-specific stacks (sandbox, staging, prod).
- `modules/` – Reusable building blocks (network, ECS service, RDS, Redis, Cognito, etc.).

## Bootstrap Steps

1. Configure remote backend (S3 + DynamoDB) credentials.
2. Initialize Terraform in `envs/sandbox` and run `terraform plan`.
3. Promote changes upstream via pull requests and Terraform Cloud/GitHub Actions pipeline.

