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