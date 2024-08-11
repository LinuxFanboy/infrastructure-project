# Include global configurations from the parent directory
include {
  path = find_in_parent_folders()
}

# Define the Terraform module source
terraform {
  source = "../../modules/vpc"
}

# Provide input variables for the VPC module
inputs = {
  cidr_block   = "10.0.0.0/16"      # The CIDR block for the VPC in the dev environment
  name         = "dev-vpc"          # The name of the VPC
  subnet_count = 2                  # The number of public subnets to create
  environment  = "dev"              # The environment name
  aws_region   = "eu-central-1"        # The AWS region
}

# Define the backend configuration for Terraform state management
remote_state {
  backend = "s3"

  config = {
    bucket         = "my-terraform-state-bucket-ss"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "my-terraform-lock-table-ss"
  }
}
