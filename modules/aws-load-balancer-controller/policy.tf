resource "aws_iam_policy" "eks_controller_policy" {
  name = "${var.project_name}-aws-load-balancer-controller"

  policy = file("${path.module}/iam_policy.json")
  tags   = var.tags
}
#Na documentação https://developer.hashicorp.com/terraform/language/functions/file vemos que dessa forma conseguimos fazer a chamada do arquivo iam_policy.json
#que contém a configuração da policy necessária