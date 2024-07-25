resource_types = [
  "azurerm_resource_group",
  "azurerm_container_registry"
]
location         = "centralindia"
environment      = "anw"
id               = "test"
sku               = "Basic"
admin_enabled     = false
public_network_access_enabled = true
anonymous_pull_enabled        = false
export_policy_enabled         = true
zone_redundancy_enabled       = false
