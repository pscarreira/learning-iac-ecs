module "prd" {
  source           = "../../infra"
  nome_repositorio = "prd-repositorio"
  cargoIAM         = "prd"
}
