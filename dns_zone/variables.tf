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
variable "tags" {
  description = "Tags for resources"
  type = map(string)
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
variable "id" {
  description = "Environment Id the resources are to be deployed to.  Used by the names module."
  type        = string
}