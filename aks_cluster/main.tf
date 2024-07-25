module "rg" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//resource-group?ref=main"
#  source                        = "./modules/rg"
  resource_group_name           = format("%s-aks", module.names.names.azurerm_resource_group)
  location                      = var.rg_location
}

module "vnet" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//virtual_network?ref=main"
#  source                        = "./modules/vnet"
  virtual_network_name          = format("%s-aks", module.names.names.azurerm_subnet)   
  resource_group_name           = format("%s-aks", module.names.names.azurerm_resource_group)
  location                      = var.rg_location
  address_space                 = var.virtual_network_address_space
  subnet                        = var.subnet_name
  address_prefixes              = var.subnet_address_prefixes
  tags                          = var.tags

  depends_on = [module.rg]
}

module "aks" {
  source                        = "git::ssh://git@github.com/appnetwise/terraform_modules.git//aks?ref=main"
  aks_cluster_name              = format("%s-aks", module.names.names.azurerm_kubernetes_cluster)
  resource_group_name           = format("%s-aks", module.names.names.azurerm_resource_group)
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

module "nsg" {
  source                       = "git::ssh://git@github.com/appnetwise/terraform_modules.git//netowrk-securitty-group?ref=main"
  network_security_group_name = format("%s-aks", module.names.names.azurerm_virtual_network)
  resource_group_name         = module.rg.resource_group_name
  location                    = var.rg_location
  tags                        = var.tags
}