module "prd" {
  source           = "../../infra"
  nome_repositorio = "prd-repositorio"
  cargoIAM         = "prd"
}

output "dns_name_prd" {
  value = module.prd.dns_name
}
