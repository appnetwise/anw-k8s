module "key-valut" {
  source = "git@github.com:appnetwise/terraform_modules.git//key-valut?ref=main"
  name                     = format("%s-kv", module.names.names.azurerm_key_vault)
  location                 = var.rg_location
  resource_group_name      = format("%s-aks", module.names.names.azurerm_resource_group)
  sku_name                 = var.sku_name
  tenant_id                = var.tenant_id 
  tags                     = var.tags
}
output "key_vault_id" {
  value = module.key-valut.key_vault_id
}
module "Key_vault_key" {
  source = "git@github.com:appnetwise/terraform_modules.git//Key_vault_key?ref=main"
  key_vault_id             = module.key-valut.key_vault_id
  name                     = format("%s-kvk", module.names.names.azurerm_key_vault_key)
  tags                     = var.tags
}