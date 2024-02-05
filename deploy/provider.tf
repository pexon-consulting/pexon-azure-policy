## Example provider configuration for TF 
terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.42.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.74.0"
    }

    azapi = {
      source = "Azure/azapi"
    }
  }
}

provider "azuread" {}

provider "azurerm" {
  features {}
}

provider "azapi" {} # needed for inheriting tags from resource group to resources
