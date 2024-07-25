variable "sku" {
  description = "The SKU for the Azure Container Registry"
  type        = string
#  default     = "Basic"
}

variable "admin_enabled" {
  description = "Whether the admin user is enabled for ACR"
  type        = bool
#  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for ACR"
  type        = bool
#  default     = true
}

variable "anonymous_pull_enabled" {
  description = "Whether anonymous pull access is enabled for ACR"
  type        = bool
#  default     = false
}

variable "export_policy_enabled" {
  description = "Whether the export policy is enabled for ACR"
  type        = bool
#  default     = true
}

variable "zone_redundancy_enabled" {
  description = "Whether zone redundancy is enabled for ACR"
  type        = bool
#  default     = false
}
variable "environment" {
  description = "Environment the resources are to be deployed to"
  type        = string
}
variable "id" {
  description = "Environment Id the resources are to be deployed to.  Used by the names module."
  type        = string
}
variable "location" {
  description = "The location the resources are to be deployed"
  type        = string
}
variable "resource_types" {
  description = "A list of Azure resource types to create names for"
  type        = list(string)
}
