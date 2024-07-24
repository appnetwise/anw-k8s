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


