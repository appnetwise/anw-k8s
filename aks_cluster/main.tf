resource "azurerm_resource_group" "this" {
  location = var.location
  name     = format("%s-rsv", module.names.names.azurerm_resource_group)
  tags     = var.tags
}