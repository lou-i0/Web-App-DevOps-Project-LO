terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}

  # client_id       = "dc2fb98a-e0fb-4de0-879e-d817b2136d87" #this is my personal student one i think 
  # client_secret   = "hfp8Q~.SzKkpgEPRMKS5ZIPfe0xsMipjwED3laLh" #this is my personal student one i think 
  # subscription_id = "5611fabc-0919-4aea-acbe-4aecceb80e4b" #this is my personal student one i think 
  # tenant_id       = "40dd58ab-b696-4929-8a7e-47811c3b1357" #this is my personal student one i think 
}

module "networking" {
  source = "./networking-module"

  # Input variables for the networking module
  resource_group_name = "aic-app-ntw-lo"
  location           = "UK South"
  vnet_address_space = ["10.0.0.0/16"]
}
module "aks_cluster" {
  source = "./aks-cluster-module"

  # Input variables for the AKS cluster module
  aks_cluster_name           = "terraform-aks-cluster"
  cluster_location           = "UK South"
  dns_prefix                 = "myaks-project"
  kubernetes_version         = "1.27.7"  # Adjust the version as needed
  service_principal_client_id = "dc2fb98a-e0fb-4de0-879e-d817b2136d87"
  service_principal_client_secret = "hfp8Q~.SzKkpgEPRMKS5ZIPfe0xsMipjwED3laLh"

  # Input variables referencing outputs from the networking module
  resource_group_name         = module.networking.resource_group_name
  vnet_id                     = module.networking.vnet_id
  control_plane_subnet_id     = module.networking.control_plane_subnet_id
  worker_node_subnet_id       = module.networking.worker_node_subnet_id
  aks_nsg_id                  = module.networking.aks_nsg_id

  # Define more input variables as needed...
}