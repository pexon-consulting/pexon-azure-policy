terraform {
  required_version = ">=1.6.2"
  backend "azurerm" {
    resource_group_name  = "TODO"
    storage_account_name = "TODO"
    container_name       = "azure-policy"
    key                  = "azure-policy.tfstate"
  }
}
