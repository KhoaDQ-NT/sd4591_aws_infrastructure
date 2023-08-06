provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "ecr_repo_be" {
  name = var.ecr_repository_be_name
}

resource "aws_ecr_repository" "ecr_repo_fe" {
  name = var.ecr_repository_fe_name
}
