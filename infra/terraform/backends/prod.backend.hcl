bucket         = "quickstyle-terraform-state"
key            = "prod/terraform.tfstate"
region         = "ap-south-1"
dynamodb_table = "quickstyle-terraform-locks"
encrypt        = true
profile        = "quickstyle-prod"

