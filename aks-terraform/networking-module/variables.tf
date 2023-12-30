# networking-module/variables.tf

# Variable to dedicate the resource group the app will reside.
variable "resource_group_name" {
  type = string
  default = "aic-app-ntw-lo"
  description = "resource group name where all resources will be housed under."
}

# to specify the location of where the app will run from.
variable "location" {
  type = string
  default = "UK South"
  description = "regional location of where all resources will be hosted in the cloud."
}

# Used to verfiy the address spce for the Virutal network the app will be use from.
variable "vnet_address_space" {
  description = "Address space for the Virtual Network (VNet)."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
