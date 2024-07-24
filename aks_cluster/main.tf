module "rg" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//resource-group?ref=main"
#  source                        = "./modules/rg"
  resource_group_name           = var.rg_name
  location                      = var.rg_location
}

module "vnet" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//virtual_network?ref=main"
#  source                        = "./modules/vnet"
  virtual_network_name          = var.virtual_network_name
  resource_group_name           = var.rg_name
  location                      = var.rg_location
  address_space                 = var.virtual_network_address_space
  subnet                        = var.subnet_name
  address_prefixes              = var.subnet_address_prefixes
  tags                          = var.tags

  depends_on = [module.rg]
}

module "aks" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//aks?ref=main"
  aks_cluster_name              = var.aks_cluster_name
  resource_group_name           = var.rg_name
  location                      = var.rg_location
  kubernetes_version            = var.kubernetes_version # Specify the desired Kubernetes version here

  #node_pool_profile
  node_pool_name                = var.node_pool_name
  node_count                    = var.node_count
  vm_size                       = var.vm_size
  subnet_id                     = module.vnet.subnet_id
  os_sku                        = var.os_sku
  os_disk_size_gb               = var.os_disk_size_gb

  os_disk_type                  = var.os_disk_type
  availability_zones            = var.availability_zones

  #enable_auto_scaling_for_node_pool
  enable_auto_scaling           = var.enable_auto_scaling
  min_count                     = var.min_count
  max_count                     = var.max_count
  max_pods                      = var.max_pods

  #network_profile
  network_plugin                = var.network_plugin 
  network_policy                = var.network_policy
  service_cidr                  = var.service_cidr
  dns_service_ip                = var.dns_service_ip
  private_cluster_enabled       = var.private_cluster_enabled
  identity_type                 = var.identity_type
  tags_environment              = var.tags_environment
  load_balancer_sku             = var.load_balancer_sku

  depends_on = [
    module.rg,
    module.vnet
  ]
}

module "acr" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//acr?ref=main"
  acr_name                      = var.acr_name
  resource_group_name           = var.rg_name
  location                      = var.rg_location
  sku                           = var.sku # Price plan for acr basic
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled  # only premium sku support to desable 
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  export_policy_enabled         = var.export_policy_enabled  # This means that images cannot be exported to other registries if false .
  zone_redundancy_enabled       = var.zone_redundancy_enabled
}

module "nsg" {
  source                       = "git::ssh://git@github.com/appnetwise/terraform_modules.git//netowrk-securitty-group?ref=main"
  network_security_group_name = var.network_security_group_name
  resource_group_name         = module.rg.resource_group_name
  location                    = var.rg_location
  tags                        = var.tags
}

module "key-valut" {
  source = "git@github.com:appnetwise/terraform_modules.git//key-valut?ref=main"
  name                     = var.name
  location                 = var.rg_location
  resource_group_name      = module.rg.resource_group_name
  sku_name                 = var.sku_name
  tenant_id                = var.tenant_id 
  tags                     = var.tags
}
# output "key_vault_id" {
#   value = module.key-valut.key_vault_id
# }
# module "Key_vault_key" {
#   source = "git@github.com:appnetwise/terraform_modules.git//Key_vault_key?ref=main"
#   key_vault_id             = module.key-valut.key_vault_id
#   tags                     = var.tags
# }

module "dns_zone" {
  source = "git@github.com:appnetwise/terraform_modules.git//dns_zone?ref=main"
  dns_name                 = lower(var.dns_name) 
  child_domain_prefix      = lower(var.child_domain_prefix)
  resource_group_name      = module.rg.resource_group_name
  tags                     = var.tags
}

module "private_dns" {
  source = "git@github.com:appnetwise/terraform_modules.git//private_dns?ref=main"
  private_dns_zones        = var.private_dns_zones
  resource_group_name      = module.rg.resource_group_name
  tags                     = var.tags
}