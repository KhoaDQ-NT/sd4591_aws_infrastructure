# my_project/main.tf

terraform {
  required_version = ">= 1.5.4" # Replace with your actual Terraform version requirement
}

provider "aws" {
  region = var.region
}

# Use the ecr module
module "ecr" {
  source              = "./ecr"
  region              = var.region
  ecr_repository_name = var.ecr_repository_name
}

# Use the vpc module
module "vpc" {
  source             = "./vpc"
  region             = var.region
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

# Use the eks module
module "eks" {
  source           = "./eks"
  region           = var.region
  eks_cluster_name = var.eks_cluster_name
  public_subnet_id = module.vpc.public_subnet_id
  # Add other variables for eks module if required
}

# Use the jenkins_docker module
module "jenkins_docker" {
  source           = "./jenkins_docker"
  region           = var.region
  ami              = var.ami
  instance_type    = var.instance_type
  key_name         = var.key_name
  jenkins_sg_cidr  = var.jenkins_sg_cidr
  docker_sg_cidr   = var.docker_sg_cidr
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  # Add other variables for jenkins_docker module if required
}
