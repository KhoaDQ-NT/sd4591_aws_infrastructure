variable "region" {
  description = "AWS region where the resources will be created."
}

variable "ecr_repository_be_name" {
  description = "Name for the ECR repository backend."
}

variable "ecr_repository_fe_name" {
  description = "Name for the ECR repository frontend."
}
