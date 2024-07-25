terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.113.0"
    }
  }
}

provider "azuread" {}
provider "azurerm" {
  features {}
}