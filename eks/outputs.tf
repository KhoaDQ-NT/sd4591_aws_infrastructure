output "eks_cluster_endpoint" {
  value = aws_eks_cluster.my_cluster.endpoint
}