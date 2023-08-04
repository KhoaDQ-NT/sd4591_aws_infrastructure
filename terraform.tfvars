region          = "ap-southeast-1"
ami             = "ami-059b01eb1dee1e15c"
instance_type   = "t2.micro"
key_name        = "myec2kp"
jenkins_sg_cidr = "0.0.0.0/0"
docker_sg_cidr  = "0.0.0.0/0"

# VPC details
vpc_cidr                   = "10.0.0.0/16"
public_subnet_cidr         = "10.0.1.0/24"
availability_zone          = "ap-southeast-1a"
public_subnet_cidr_another = "10.0.2.0/24"
availability_zone_another  = "ap-southeast-1b"

# ECR details
ecr_repository_name = "my-ecr-repo-devops"

# EKS details
eks_cluster_name = "my-eks-cluster-devops"
