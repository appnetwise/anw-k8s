location             = "Central India"
resource_group_name  = "terraform-anw"
virtual_network_name = "tf-anw-vnet"
address_space        = ["10.0.0.0/16"]
subnet               = "tf-anw-subnet"
address_prefixes     = ["10.0.1.0/24"]
network_security_group_name = "tf-anw-nsg"
tags                 = {
  environment = "dev"
}

environment          = "anw"
id                   = "my"
resource_types       = [ "azurerm_resource_group","azurerm_virtual_network", "azurerm_subnet", "azurerm_network_security_group" ]