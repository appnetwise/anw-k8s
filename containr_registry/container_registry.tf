module "acr" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//acr?ref=main"
  acr_name                      = format(module.names.names.azurerm_container_registry)
  resource_group_name           = format("%s-aks", module.names.names.azurerm_resource_group)
  location                      = var.location
  sku                           = var.sku # Price plan for acr basic
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled  # only premium sku support to desable 
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  export_policy_enabled         = var.export_policy_enabled  # This means that images cannot be exported to other registries if false .
  zone_redundancy_enabled       = var.zone_redundancy_enabled
}
