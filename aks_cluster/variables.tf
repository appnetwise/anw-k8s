variable "location" {
  description = "Location the resources are to be deployed"
  type        = string
}
variable "name" {
  description = "The name of the Key Vault"
  type        = string
  default     = "keyanwdevtest"
}
variable "resource_group_name" {
  description = "Name of the Resource Group to deploy the resources to"
  type        = string
}
variable "dns_name" {
  description = "Name of the Resource Group to deploy the resources to"
  type        = string
}
variable "private_dns_zones" {
  description = "Name of the Resource Group to deploy the resources to"
  type        = list(string)
}
variable "child_domain_prefix" {
  description = "Name of the Resource Group to deploy the resources to"
  type        = string
}
variable "tenant_id" {
  description = "The ID of the Azure Active Directory tenant"
  type        = string
  default     = "30004a29-bd77-41c7-b860-68e2dad43e08"
}
variable "ip_rules" {
  description = "A list of public IP address allowed to access the Storage Account"
  type        = list(string)
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = { environment = "dev" }
}
# variable "subnet_id" {
#   description = "Resource ID of the subnet for the Private Endpoint"
#   type        = string
# }
# variable "private_dns_zone_ids" {
#   description = "A list of private DNS zone Resource IDs to create a record in"
#   type        = list(string)
# }

variable "sku_name" {
  description = "sku name for the key vault to deploy"
  type        = string
  default     = "standard"
}