


module "RG" {
  source = "git::https://github.com/absk123/resource_group.git//azure_resource_group?ref=main"
  rg     = var.rg
}

module "SA" {
  source = "git::ssh://git@github.com/absk123/storage_account.git//azure_storage_account?ref=main"
  sa     = var.sa
  gg     = module.RG.Resource_Group
}

module "VNET" {
  source = "git::ssh://git@github.com/absk123/virtual_network.git//azure_virtual_network?ref=main"
  nets   = var.nets
  rg     = module.RG.Resource_Group
}

module "WEB" {
  source = "git::ssh://git@github.com/absk123/app_service.git//azure_app_service?ref=main"
  web    = var.web
  rg     = module.RG.Resource_Group
}

module "AKS" {
  source = "git::ssh://git@github.com/absk123/aks_cluster.git//azure_aks_cluster?ref=main"
  aks    = var.aks
  rg     = module.RG.Resource_Group
}

module "DB" {
  source = "git::ssh://git@github.com/absk123/data_base.git//azure_data_base?ref=main"
  db     = var.db
  rg     = module.RG.Resource_Group
}

module "PIP" {
  source = "git::ssh://git@github.com/absk123/public_ip.git//azure_public_ip?ref=main"
  pip    = var.pip
  rg     = module.RG.Resource_Group
}

module "AGW" {
  source = "git::ssh://git@github.com/absk123/app_gateway.git//azure_app_gateway?ref=main"
  agw    = var.agw
  rg     = module.RG.Resource_Group
  sbnet  = module.VNET.Sub_Network
  pip    = module.PIP.Public_IP
}