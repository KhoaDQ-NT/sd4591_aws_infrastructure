variable "region" {
  description = "AWS region where the resources will be created."
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
}

variable "availability_zone" {
  description = "Availability zone for the public subnet."
}

variable "public_subnet_cidr_another" {
  description = "CIDR block for another public subnet."
}

variable "availability_zone_another" {
  description = "Availability zone for another public subnet."
}
