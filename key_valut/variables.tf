variable "tenant_id" {
  description = "The ID of the Azure Active Directory tenant"
  type        = string
}
variable "sku_name" {
  description = "sku name for the key vault to deploy"
  type        = string
}
variable "rg_location" {
  description = "The location of the resource group"
  type        = string
  default     = "Central India"
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
variable "environment" {
  description = "Environment the resources are to be deployed to"
  type        = string
}
variable "tags" {
  description = "Tags for resources"
  type = map(string)
}