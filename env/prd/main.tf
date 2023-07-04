module "prd" {
  source           = "../../infra"
  nome_repositorio = "prd-repositorio"
  cargoIAM         = "prd"
  ambiente         = "prd-env"
}

output "dns_name_prd" {
  value = module.prd.dns_name
}
