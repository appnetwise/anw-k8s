resource "azurerm_resource_group" "this" {
  location = var.location
  name     = var.resource_group_name
  tags     = var.tags
}

module "key-valut" {
  source = "git@github.com:appnetwise/terraform_modules.git//key-valut?ref=main"
  name                     = var.name
  location                 = var.location
  resource_group_name      = azurerm_resource_group.this.name
  sku_name                 = var.sku_name
  tenant_id                = var.tenant_id 
  tags                     = var.tags
}
output "key_vault_id" {
  value = module.key-valut.key_vault_id
}
# module "Key_vault_key" {
#   source = "git@github.com:appnetwise/terraform_modules.git//Key_vault_key?ref=main"
#   key_vault_id             = module.key-valut.key_vault_id
#   tags                     = var.tags
# }

module "dns_zone" {
  source = "git@github.com:appnetwise/terraform_modules.git//dns_zone?ref=main"
  dns_name                 = lower(var.dns_name) 
  child_domain_prefix      = lower(var.child_domain_prefix)
  resource_group_name      = azurerm_resource_group.this.name
  tags                     = var.tags
}

module "private_dns" {
  source = "git@github.com:appnetwise/terraform_modules.git//private_dns?ref=main"
  private_dns_zones        = var.private_dns_zones
  resource_group_name      = azurerm_resource_group.this.name
  tags                     = var.tags
}