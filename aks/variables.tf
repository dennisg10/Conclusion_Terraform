variable "rg_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "rg_prefix_short" {
  description = "Resource Name Short"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "rg_cluster_prefix" {
  type        = string
  default     = "cl1"
  description = "AKS Cluster Prefix"
}


variable "tags" {
  type = map(any)
}


variable "mui_id" {
  type = list(object({
    name = string
    tags = map(any)
  }))
  default = [
    {
      name = null,
      tags = null
    }
  ]
}


variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 3
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."
  default     = null
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}