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

variable "key_name" {
  description = "Name of the EC2 key pair used for Jenkins and Docker EC2 instance."
}

variable "jenkins_sg_cidr" {
  description = "CIDR block to restrict Jenkins access."
}

variable "docker_sg_cidr" {
  description = "CIDR block to restrict Docker access."
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
