region          = "ap-southeast-1"
ami             = "ami-059b01eb1dee1e15c"
instance_type   = "t3a.large"
instance_count  = "3"
key_name        = "myec2kp"
jenkins_sg_cidr = "0.0.0.0/0"
docker_sg_cidr  = "0.0.0.0/0"

# VPC details
vpc_name        = "my-vpc"
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
intra_subnets   = ["10.0.5.0/24", "10.0.6.0/24"]

# ECR details
ecr_repository_be_name = "my-ecr-repo-devops/backend"
ecr_repository_fe_name = "my-ecr-repo-devops/frontend"

# EKS details
eks_cluster_name = "my-eks-cluster-devops"
