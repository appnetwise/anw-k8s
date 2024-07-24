
module "rg" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//modules/resource-group?ref=tf-skb"
  resource_group_name           = var.resource_group_name
  location                      = var.location
}

module "vnet" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//modules/virtual_network?ref=tf-skb"
  resource_group_name           = module.rg.resource_group_name
  location                      = var.location
  virtual_network_name          = var.virtual_network_name
  address_space                 = var.address_space 
  tags                          = var.tags
  subnet                        = var.subnet
  address_prefixes              = var.address_prefixes
}
# Network Security Group
module "nsg" {
  source                       = "git::ssh://git@github.com/appnetwise/terraform_modules.git//modules/netowrk-securitty-group?ref=tf-skb"
  network_security_group_name = var.network_security_group_name
  resource_group_name         = module.rg.resource_group_name
  location                    = var.location 
  tags                        = var.tags
}
