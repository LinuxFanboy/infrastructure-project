# Define the CIDR block for the VPC with a default value
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Define the name of the VPC with a default value
variable "name" {
  description = "The name for the VPC"
  type        = string
  default     = "my-vpc-ss"
}

# Define the number of public subnets to create with a default value
variable "subnet_count" {
  description = "The number of subnets to create"
  type        = number
  default     = 2
}

# Define the environment (e.g., dev, stage, prod) with a default value
variable "environment" {
  description = "The environment for the VPC (e.g., dev, stage, prod)"
  type        = string
  default     = "dev"
}

# Define the AWS region with a default value
variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "eu-central-1"
}
