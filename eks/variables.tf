variable "region" {
  description = "AWS region where the resources will be created."
}

variable "eks_cluster_name" {
  description = "Name for the EKS cluster."
}

variable "private_subnet_ids" {
  description = "Private subnets."
}

variable "intra_subnet_ids" {
  description = "Intra subnets."
}

variable "vpc_id" {
  description = "ID of the VPC."
}
