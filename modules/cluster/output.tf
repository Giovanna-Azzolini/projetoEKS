output "oidc" {
  value = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}


