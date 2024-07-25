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