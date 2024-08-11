# Configure the backend to store Terraform state in an S3 bucket
terraform {
  backend "s3" {}
}

# Create a VPC with a specified CIDR block
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.name
    Environment = var.environment
  }
}

# Create public subnets within the VPC
resource "aws_subnet" "public" {
  count = var.subnet_count

  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name}-public-${count.index}"
    Environment = var.environment
  }
}

# Create an Internet Gateway for the VPC to allow internet access
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name}-igw"
    Environment = var.environment
  }
}

# Create a route table for the public subnets and associate the Internet Gateway
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.name}-public-rt"
    Environment = var.environment
  }
}

# Associate the public subnets with the route table to enable internet access
resource "aws_route_table_association" "public" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
