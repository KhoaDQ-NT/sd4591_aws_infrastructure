output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet ID for EC2 instances"
  value       = module.vpc.public_subnets # Assuming you want to output the first public subnet's IP
}

output "private_subnet_ids" {
  description = "Private subnet ID for EC2 instances"
  value       = module.vpc.private_subnets
}

output "intra_subnet_ids" {
  description = "Intra subnet ID for EC2 instances"
  value       = module.vpc.intra_subnets
}

