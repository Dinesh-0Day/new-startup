variable "name_prefix" {
  description = "Prefix for resource naming"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "azs" {
  description = "Availability zones for subnets"
  type        = list(string)
}

variable "tags" {
  description = "Common tags applied to resources"
  type        = map(string)
  default     = {}
}

