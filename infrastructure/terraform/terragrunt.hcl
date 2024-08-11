# Global Terragrunt configuration
#
#remote_state {
#  backend = "s3"
#
#  config = {
#    bucket         = "my-terraform-state-bucket-ss"
#    key            = "${path_relative_to_include()}/terraform.tfstate"
#    region         = "eu-central-1"
#    encrypt        = true
#    dynamodb_table = "my-terraform-lock-table-ss"
#  }
#}
#
#terraform {
#  extra_arguments "common_vars" {
#    commands = get_terraform_commands_that_need_vars()
#    arguments = [
#      "-var-file=terraform.tfvars"
#    ]
#  }
#}

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

inputs = {
  cidr_block   = "10.0.0.0/16"       # CIDR block for the VPC
  name         = "my-vpc"            # Name of the VPC
  subnet_count = 2                   # Number of public subnets to create
  environment  = "dev"               # Environment name (e.g., dev, stage, prod)
  aws_region   = "eu-central-1"      # AWS region where the resources will be deployed
}


