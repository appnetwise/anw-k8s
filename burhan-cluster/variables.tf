variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  type        = list(string)

}

variable "location" {
  description = "The location/region where the virtual network is created."
  type        = string

}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string

}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)

}

variable "subnet" {
  description = "the name of subnet" 
  type = string

}

variable "address_prefixes" {
  description = "The address prefixes to use for the subnet"
  type = list(string)

}

variable "network_security_group_name" {
    description = "The name of the Network Security Group."
    type        = string
 
}

variable "environment" {
  type        = string
  description = "Deployment environment.  Used in resource naming convention."
}

variable "id" {
  type        = string
  description = "Naming identifier for the deployment.  Used in resource naming convention."
}

variable "resource_types" {
  type        = list(string)
  description = "List of resources that names will be returned for.  If not provided, all supported CAF names will be returned."
  default     = []
}

variable "random_suffix" {
  type        = bool
  description = "If set to false, no random suffix will be generated."
  default     = false
}

variable "prefix_transforms" {
  type = list(object({
    resource_type = string,
    search        = string,
    replace       = string
  }))
  description = "List of prefix transformations to be applied to the normal CAF naming output."
  default     = []
}
