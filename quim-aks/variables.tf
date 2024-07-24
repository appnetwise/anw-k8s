variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  default     = "anw-rg"
}

variable "rg_location" {
  description = "The location of the resource group"
  type        = string
  default     = "Central India"
}

# Virtual network
variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "anw-vnet"
}

variable "virtual_network_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "anw-aks-subnet"
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "tags" {
  description = "Tags for resources"
  type = map(string)
  default = {
    "environment" = "dev-test-lab"
  }
}


# Azure Kubernetes Cluster
variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
  default     = "anwaks"
}

variable "kubernetes_version" {
  description = "The Kubernetes version to use for the AKS cluster"
  type        = string
  default     = "1.28.10"
}

variable "node_pool_name" {
  description = "The name of the AKS node pool"
  type        = string
  default     = "nodepool"
}

variable "node_count" {
  description = "The initial number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "The size of the virtual machines in the node pool"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "os_sku" {
  description = "The OS SKU for the AKS nodes"
  type        = string
  default     = "Ubuntu"
}

variable "os_disk_size_gb" {
  description = "The OS disk size in GB for the AKS nodes"
  type        = number
  default     = 30
}

variable "enable_auto_scaling" {
  description = "Whether to enable auto-scaling for the AKS node pool"
  type        = bool
  default     = true
}

variable "min_count" {
  description = "The minimum number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "max_count" {
  description = "The maximum number of nodes in the node pool"
  type        = number
  default     = 2
}

variable "max_pods" {
  description = "The maximum number of pods per node"
  type        = number
  default     = 31
}

variable "network_plugin" {
  description = "The network plugin to use for the AKS cluster"
  type        = string
  default     = "azure"
}

variable "network_policy" {
  description = "The network policy to use for the AKS cluster"
  type        = string
  default     = "calico"
}

variable "service_cidr" {
  description = "The CIDR range for the Kubernetes services"
  type        = string
  default     = "10.0.2.0/24"
}

variable "dns_service_ip" {
  description = "The IP address for the DNS service in the AKS cluster"
  type        = string
  default     = "10.0.2.10"
}

variable "private_cluster_enabled" {
  description = "Whether to enable private cluster for AKS"
  type        = bool
  default     = false
}

variable "identity_type" {
  description = "The identity type for the AKS cluster"
  type        = string
  default     = "SystemAssigned"
}

variable "tags_environment" {
  description = "Tags for the environment"
  type = map(string)
  default = {
    "environment" = "dev-test-lab"
  }
}

# Azure Container Registry
variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
  default     = "anwacr"
}

variable "sku" {
  description = "The SKU for the Azure Container Registry"
  type        = string
  default     = "Basic"
}

variable "admin_enabled" {
  description = "Whether the admin user is enabled for ACR"
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for ACR"
  type        = bool
  default     = true
}

variable "anonymous_pull_enabled" {
  description = "Whether anonymous pull access is enabled for ACR"
  type        = bool
  default     = false
}

variable "export_policy_enabled" {
  description = "Whether the export policy is enabled for ACR"
  type        = bool
  default     = true
}

variable "zone_redundancy_enabled" {
  description = "Whether zone redundancy is enabled for ACR"
  type        = bool
  default     = false
}
