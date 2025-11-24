output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}

output "oidc" {
  value = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "certificate_authority" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data #Na saída do output, vi que o base64 contendo o certificado vinha no objeto data dentro de uma lista, então passando a chamada assim, ele vai puxar o base64
}

output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}
