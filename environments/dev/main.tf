module "rg" {
  source   = "../../modules/rg"
  rg_name  = var.rg_name
  location = var.location
}

module "vnet" {
  source          = "../../modules/vnet"
  vnet_name       = var.vnet_name
  location        = module.rg.location
  rg_name         = module.rg.rg_name
  address_space   = var.address_space
  subnet_name     = var.subnet_name
  subnet_prefixes = var.subnet_prefixes
}

module "storage" {
  source               = "../../modules/storage"
  storage_account_name = var.storage_account_name
  rg_name              = module.rg.rg_name
  location             = module.rg.location
}

module "aks" {
  source             = "../../modules/aks"
  aks_name           = var.aks_name
  location           = module.rg.location
  rg_name            = module.rg.rg_name
  dns_prefix         = var.dns_prefix
  kubernetes_version = var.kubernetes_version
  node_count         = var.node_count
  vm_size            = var.vm_size
  subnet_id          = module.vnet.subnet_id
}