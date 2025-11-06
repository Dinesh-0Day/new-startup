terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.30"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

locals {
  project = "quickstyle"
  env     = "sandbox"
  tags = {
    Project     = local.project
    Environment = local.env
    ManagedBy   = "Terraform"
  }
}

module "network" {
  source = "../../modules/network"

  name_prefix = "${local.project}-${local.env}"
  cidr_block  = var.vpc_cidr
  azs         = var.availability_zones
  tags        = local.tags
}

