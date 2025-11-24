locals {
  oidc = split("/", var.oidc)[4] #aqui ele vai quebrar a url que passamos na variable oidc, e ler apenas o array número 4, que pega apenas o id
}