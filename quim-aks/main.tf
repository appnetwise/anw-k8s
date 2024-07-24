
module "rg" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//modules/resource-group?ref=tf-skb"
#  source                        = "./modules/rg"
  resource_group_name           = var.rg_name
  location                      = var.rg_location
}

module "vnet" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//modules/virtual_network?ref=tf-skb"
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
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//aks?ref=quim"
  aks_cluster_name              = var.aks_cluster_name
  resource_group_name           = var.rg_name
  location                      = var.rg_location
  kubernetes_version            = var.kubernetes_version # Specify the desired Kubernetes version here
  node_pool_name                = var.node_pool_name
  node_count                    = var.node_count
  vm_size                       = var.vm_size
  subnet_id                     = module.vnet.subnet_id
  os_sku                        = var.os_sku
  os_disk_size_gb               = var.os_disk_size_gb
  enable_auto_scaling           = var.enable_auto_scaling
  min_count                     = var.min_count
  max_count                     = var.max_count
  max_pods                      = var.max_pods
  network_plugin                = var.network_plugin 
  network_policy                = var.network_policy
  service_cidr                  = var.service_cidr
  dns_service_ip                = var.dns_service_ip
  private_cluster_enabled       = var.private_cluster_enabled
  identity_type                 = var.identity_type
  tags_environment              = var.tags_environment

  depends_on = [
    module.rg,
    module.vnet
  ]
}

module "acr" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//acr?ref=quim"
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
