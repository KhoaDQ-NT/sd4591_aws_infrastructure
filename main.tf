# my_project/main.tf

terraform {
  required_version = ">= 1.5.4" # Replace with your actual Terraform version requirement
}

provider "aws" {
  region = var.region
}

# Use the ecr module
module "ecr" {
  source                 = "./ecr"
  region                 = var.region
  ecr_repository_be_name = var.ecr_repository_be_name
  ecr_repository_fe_name = var.ecr_repository_fe_name
}

# Use the vpc module
module "vpc" {
  source   = "./vpc"
  region   = var.region
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  # azs             = var.azs
  public_subnets  = var.public_subnets
  intra_subnets   = var.intra_subnets
  private_subnets = var.private_subnets
}

# Use the eks module
module "eks" {
  source             = "./eks"
  region             = var.region
  eks_cluster_name   = var.eks_cluster_name
  private_subnet_ids = module.vpc.private_subnet_ids
  intra_subnet_ids   = module.vpc.intra_subnet_ids
  vpc_id             = module.vpc.vpc_id
  # Add other variables for eks module if required
}

# Use the jenkins_docker module
module "jenkins_docker" {
  source            = "./jenkins_docker"
  region            = var.region
  ami               = var.ami
  instance_type     = var.instance_type
  instance_count    = var.instance_count
  key_name          = var.key_name
  jenkins_sg_cidr   = var.jenkins_sg_cidr
  docker_sg_cidr    = var.docker_sg_cidr
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  # Add other variables for jenkins_docker module if required
}
