terraform {
  backend "azurerm" {
    resource_group_name  = "demo-aks-backend"
    storage_account_name = "backendarjun1432026"
    container_name       = "demo"
    key                  = "dev.terraform.tfstate"
  }
}