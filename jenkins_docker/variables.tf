variable "region" {
  description = "AWS region where the resources will be created."
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

variable "vpc_id" {
  description = "ID of the VPC."
}

variable "public_subnet_id" {
  description = "ID of the public subnet."
}
