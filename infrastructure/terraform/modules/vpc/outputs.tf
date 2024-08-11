# Output the ID of the created VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

# Output the IDs of the created public subnets
output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

# Output the ID of the created Internet Gateway
output "igw_id" {
  description = "The ID of the internet gateway"
  value       = aws_internet_gateway.igw.id
}
