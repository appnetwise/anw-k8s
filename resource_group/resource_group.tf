module "rg" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//resource-group?ref=main"
#  source                        = "./modules/rg"
  resource_group_name           = format("%s-aks", module.names.names.azurerm_resource_group)
  location                      = var.location
}
