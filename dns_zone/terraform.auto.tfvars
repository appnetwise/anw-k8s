dns_name = "dev.com"
child_domain_prefix = "terrform"
private_dns_zones = ["dev.com"]
tags = {
  environment = "test"
}
resource_types = [
  "azurerm_resource_group",
  "azurerm_private_dns_zone",
  "azurerm_dns_zone"
]
location             = "centralindia"
environment      = "anw"
id               = "test"