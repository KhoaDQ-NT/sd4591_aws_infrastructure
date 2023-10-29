output "ecr_repository_be_url" {
  value = aws_ecr_repository.ecr_repo_be.repository_url
}

output "ecr_repository_fe_url" {
  value = aws_ecr_repository.ecr_repo_fe.repository_url
}
