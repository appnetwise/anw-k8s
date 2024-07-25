tags = {
  environment = "test"
}
tenant_id = "30004a29-bd77-41c7-b860-68e2dad43e08"
sku_name = "standard"
name = "keydevanw"
dns_name = "dev.com"
child_domain_prefix = "terrform"
private_dns_zones = ["dev.com"]
resource_types = [
  "azurerm_resource_group",
  "azurerm_recovery_services_vault",
  "azurerm_virtual_network",
  "azurerm_subnet",
  "azurerm_key_vault",
  "azurerm_network_security_group",
  "aks_node_pool_linux",
  "aks_node_pool_windows",
  "azurerm_dns_zone",
  "azurerm_private_dns_zone",
  "azurerm_kubernetes_cluster",
  "azurerm_container_registry"
]
location             = "centralindia"
environment      = "anw"
id               = "test"
address_prefixes = ["10.0.1.32/27"]

rg_name                       = "anw-rg"
rg_location                   = "Central India"
virtual_network_name          = "anw-vnet"
virtual_network_address_space = ["10.0.0.0/16"]
subnet_name                   = "anw-aks-subnet"
subnet_address_prefixes       = ["10.0.1.0/24"]
aks_cluster_name              = "anwaks"
kubernetes_version            = "1.28.10"
node_pool_name                = "nodepool"
node_count                    = 1
vm_size                       = "Standard_D2s_v3"
os_sku                        = "Ubuntu"
os_disk_size_gb               = 30
enable_auto_scaling           = true
min_count                     = 1
max_count                     = 2
max_pods                      = 31
network_plugin                = "azure"
network_policy                = "calico"
service_cidr                  = "10.0.2.0/24"
dns_service_ip                = "10.0.2.10"
private_cluster_enabled       = false
identity_type                 = "SystemAssigned"
load_balancer_sku             = "basic"
acr_name                      = "anw-acr"


zone_redundancy_enabled       = false
network_security_group_name   = "tf-anw-nsg" 
os_disk_type                  = "Managed"
availability_zones            = []

