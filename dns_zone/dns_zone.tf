module "dns_zone" {
  source = "git@github.com:appnetwise/terraform_modules.git//dns_zone?ref=main"
  dns_name                 = lower(var.dns_name)
  child_domain_prefix      = lower(var.child_domain_prefix)
  resource_group_name      = format("%s-aks", module.names.names.azurerm_resource_group)
  tags                     = var.tags
}

module "private_dns" {
  source = "git@github.com:appnetwise/terraform_modules.git//private_dns?ref=main"
  private_dns_zones        = var.private_dns_zones
  resource_group_name      = format("%s-aks", module.names.names.azurerm_resource_group)
  tags                     = var.tags
}