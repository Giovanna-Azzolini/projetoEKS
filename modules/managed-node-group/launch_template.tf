resource "aws_launch_template" "node_lt" {
  name = "${var.project_name}-lt"

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional" # ← ESSENCIAL para o Load Balancer Controller
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      var.tags,
      {
        Name = "${var.project_name}-lt"
      }
    )
  }
}

# O Launch Template é necessário para configurar metadata_options do EC2.
# Por padrão, o Node Group pode ser criado exigindo IMDSv2 (http_tokens = "required").
# Isso bloqueia o acesso ao Instance Metadata, e o AWS Load Balancer Controller falha
# ao buscar o VPC ID (erro: context deadline exceeded).
# Com http_tokens = "optional", o controller acessa a metadata normalmente
# e o node group funciona sem crash.
