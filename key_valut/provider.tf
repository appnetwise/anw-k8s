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
    subscription_id = "2613c312-c74e-430c-b04c-2c758cfa7753"
    client_id       = "6617857a-c8f9-4b8b-a037-c8c913a45c26"
    client_secret   = "Tlk8Q~7xy2hHhgCW3a4gZjYRebKLCT8evwXR-bK4"
    tenant_id       = "30004a29-bd77-41c7-b860-68e2dad43e08"
  features {}
}