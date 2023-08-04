variable "region" {
  description = "AWS region where the resources will be created."
}

variable "eks_cluster_name" {
  description = "Name for the EKS cluster."
}

variable "public_subnet_id" {
  description = "ID of the public subnet."
}

variable "public_subnet_id_another" {
  description = "ID of another public subnet."
}
