
module "rg" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//modules/resource-group?ref=tf-skb"
  resource_group_name           = format("%s-aks", module.names.names.azurerm_resource_group) #var.resource_group_name
  location                      = var.location
}

module "vnet" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//modules/virtual_network?ref=tf-skb"
  resource_group_name           = module.rg.resource_group_name
  location                      = var.location
  virtual_network_name          = format("%s-aks", module.names.names.azurerm_virtual_network) #var.virtual_network_name
  address_space                 = var.address_space 
  tags                          = var.tags
  subnet                        = format("%s-aks", module.names.names.azurerm_subnet) #var.subnet
  address_prefixes              = var.address_prefixes
}

module "nsg" {
  source                       = "git::ssh://git@github.com/appnetwise/terraform_modules.git//modules/netowrk-securitty-group?ref=tf-skb"
  network_security_group_name = format("%s-aks", module.names.names.azurerm_network_security_group)
  resource_group_name         = module.rg.resource_group_name
  location                    = var.location 
  tags                        = var.tags
}



# module "naming" {
#   source                      = "git::ssh://git@github.com/appnetwise/terraform_modules.git//modules/names?ref=tf-skb"
#   environment                 = var.environment
#   location                    = var.location
#   id                          = var.id
#   resource_types              = var.resource_types
#   random_suffix               = false
#   prefix_transforms = [
#     {
#       resource_type = "azurerm_subnet"
#       search        = "snet"
#       replace       = "sn"
#     }
#   ]
# }