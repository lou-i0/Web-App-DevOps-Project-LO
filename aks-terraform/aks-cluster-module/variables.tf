# aks-cluster/variables.tf
module "ntwk_out" {
  source = "../networking-module"

  #define variables to use
  
}


variable "aks_cluster_name" {
  type = string
  default = "lotest-aks-cluster"
  description = "used to deinfe the name of the aks cluster."
}

variable "cluster_location" {
    type = string
    default = "UK South"
    description = "the location of where the cloud service will be hosted."
}

variable "dns_prefix" {
  type = string
  default = "aks-lotest"
  description = "prefix to apply to any dns address used."
}

variable "kubernetes_version" {
  type = string
  default = "1.27.7"
  description = "version of kubernetes to use."
}

variable "service_principal_client_id" {
  type = string
  default = "dc2fb98a-e0fb-4de0-879e-d817b2136d87"
  description = "account id to interact with azure services."
}

variable "service_principal_client_secret" {
  type = string
  default = "hfp8Q~.SzKkpgEPRMKS5ZIPfe0xsMipjwED3laLh"
  description = "password of service principal id."
}

# Input variables from the networking module
variable "resource_group_name" {
  type = string
  default = module.ntwk_out.resource_group_name
  description = "resource group all aks resources will be created under."
}

variable "vnet_id" {
  type = string
  default = module.ntwk_out.vnet_id
  description = "id for the vnet set up in the networking module."
}

variable "control_plane_subnet_id" {
  type = string
  default = module.ntwk_out.control_plane_subnet_id 
  description = "id of the control plane set up in the networking module."
}

variable "worker_node_subnet_id" {
  type = string
  default = module.ntwk_out.worker_node_subnet_id  
  description = "if of the worker node set up in the networking module."
}