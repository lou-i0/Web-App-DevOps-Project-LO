# in command prompt,  do this:
# az login, login to your azure cloud
# az account list --output table, displays info on subscriptions.
# az ad sp create-for-rbac --name {terrsp} --role contributor --scopes /subscriptions/{sub-id}
# az ad sp create-for-rbac --name terrsp --role contributor --scopes /subscriptions/5611fabc-0919-4aea-acbe-4aecceb80e4b
# list displayname of service principal, az ad sp list --display-name terrsp --query "[0].appDisplayName"
# to get service principal id (not appid!), az ad sp list --display-name terrsp --query "[0].id"
# to reset crednetials of service principal, az ad sp credential reset --id <>

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

  # client_id       = "f55f9f4d-3e43-4b06-9687-c4e1f053bae3"
  # client_secret   = "StO8Q~yZbUWujjPQr.2qXk3Ovb.zPYBQlUh1gbko"
  # subscription_id = "7f552ba8-98a9-473e-961a-2b609be0c3d7"
  # tenant_id       = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
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
  service_principal_client_id = "b975074d-a973-4d61-b79c-511cc49260f9"
  service_principal_client_secret = "Lcy8Q~D82uEkLdAi5IPV1rCg_YOyexwz5ZOfPaCJ"

  # Input variables referencing outputs from the networking module
  resource_group_name         = module.networking.resource_group_name
  vnet_id                     = module.networking.vnet_id
  control_plane_subnet_id     = module.networking.control_plane_subnet_id
  worker_node_subnet_id       = module.networking.worker_node_subnet_id
  aks_nsg_id                  = module.networking.aks_nsg_id

  # Define more input variables as needed...
}