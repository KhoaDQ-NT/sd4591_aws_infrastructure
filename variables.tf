variable "region" {
  description = "AWS region where the resources will be created."
}

variable "ecr_repository_be_name" {
  description = "Name for the ECR repository backend."
}

variable "ecr_repository_fe_name" {
  description = "Name for the ECR repository frontend."
}

variable "eks_cluster_name" {
  description = "Name for the EKS cluster."
}

variable "ami" {
  description = "AMI ID of the Jenkins and Docker EC2 instance."
}

variable "instance_type" {
  description = "Instance type for the Jenkins and Docker EC2 instance."
}

variable "instance_count" {
  description = "Instance count for the Jenkins and Docker EC2 instance."
}

variable "key_name" {
  description = "Name of the EC2 key pair used for Jenkins and Docker EC2 instance."
}

variable "jenkins_sg_cidr" {
  description = "CIDR block to restrict Jenkins access."
}

variable "docker_sg_cidr" {
  description = "CIDR block to restrict Docker access."
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
