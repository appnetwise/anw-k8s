variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "tf-anw-vnet"
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "location" {
  description = "The location/region where the virtual network is created."
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "terraform-anw"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {
    environment = "dev"
  }
}

variable "subnet" {
  description = "the name of subnet" 
  type = string
  default = "tf--anw-subnet"
}

variable "address_prefixes" {
  description = "The address prefixes to use for the subnet"
  type = list(string)
  default = [ "10.0.1.0/24" ]
}

variable "network_security_group_name" {
    description = "The name of the Network Security Group."
    type        = string
    default     = "tf-anw-nsg" 
}


