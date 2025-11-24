# Super Módulo EKS — Deploy completo, modular e lindão ✨

Este repositório contém um **Super Módulo Terraform** criado para provisionar um ambiente completo de **Amazon EKS**, desde a **rede** até o **node group**, passando pelo **cluster** e pelo **AWS Load Balancer Controller**.  
A ideia é simples: **você escreve pouco, o Terraform faz muito.**

Este projeto está dividido em **4 submódulos**, cada um responsável por uma parte essencial do EKS:

### 🧩 Submódulos inclusos
- **network** → Cria tudo que a base precisa: VPC, subnets públicas/privadas, route tables, etc.  
- **cluster** → Provisiona o EKS em si, configura o OIDC, roles, policies e toda a mágica do controle.  
- **managed-node-group** → Sobe o node group gerenciado pela AWS (com IAM, escalonamento, labels, taints, tudo pronto).  
- **aws-load-balancer-controller** → Instala via Helm o ALB Controller, permitindo Ingress e balanceamento automágico.  

Juntos, eles formam um módulo completo e reutilizável para criar um EKS **100% funcional, organizado e extensível**, perfeito para estudos, PoCs ou produção (com ajustes mínimos).

---

## 🔁 Como reutilizar este Super Módulo

Se você quiser usar este repositório diretamente no seu projeto, basta apontar o `source` para ele.  
Exemplo usando o GitHub:

```hcl
module "eks" {
  source = "https://github.com/Giovanna-Azzolini/projetoEKS.git"

  # aqui você passa os inputs necessários, por exemplo:
  project_name = "meu-eks"
  region       = "us-east-1"
  cidr_block   = "10.0.0.0/16"
  tags = {
    owner = "voce"
  }
}
```

Depois é só rodar:

```bash
terraform init
terraform apply
```

E pronto: seu cluster EKS estará sendo criado bonitinho.  
Sem precisar baixar o código, sem mistério.

---

Abaixo está a documentação gerada automaticamente pelo `terraform-docs`, com detalhes completos dos inputs, outputs e módulos do projeto:


# projetoEKS
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.20.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 3.1.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.38.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_aws_load_balancer_controller"></a> [eks\_aws\_load\_balancer\_controller](#module\_eks\_aws\_load\_balancer\_controller) | ./modules/aws-load-balancer-controller | n/a |
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | ./modules/cluster | n/a |
| <a name="module_eks_managed_node_group"></a> [eks\_managed\_node\_group](#module\_eks\_managed\_node\_group) | ./modules/managed-node-group | n/a |
| <a name="module_eks_network"></a> [eks\_network](#module\_eks\_network) | ./modules/network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Networking CIDR block to be used | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name to be used to name the resources (Name tag) | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region to create the resources | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all AWS resources | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ca"></a> [ca](#output\_ca) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_oidc"></a> [oidc](#output\_oidc) | n/a |
<!-- END_TF_DOCS -->
