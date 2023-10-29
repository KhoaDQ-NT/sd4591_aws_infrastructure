variable "region" {
  description = "AWS region where the resources will be created."
}

variable "vpc_name" {
  description = "Name for the VPC."
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
}

# variable "azs" {
#   description = "Availability zones for another public subnet."
# }

variable "public_subnets" {
  description = "CIDR blocks for the public subnet."
}

variable "private_subnets" {
  description = "Private subnets."
}

variable "intra_subnets" {
  description = "Intra subnets."
}
