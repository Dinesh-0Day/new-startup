# Terraform Backends

Define remote backend configuration per environment (S3 bucket + DynamoDB lock table).

Example (`sandbox.backend.hcl`):

```
bucket         = "quickstyle-terraform-state"
key            = "sandbox/terraform.tfstate"
region         = "ap-south-1"
dynamodb_table = "quickstyle-terraform-locks"
encrypt        = true
profile        = "quickstyle-dev"
```

Use `terraform init -backend-config=backends/sandbox.backend.hcl`.

