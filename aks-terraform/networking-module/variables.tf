# networking-module/variables.tf

# Variable to dedicate the resource group the app will reside.
variable "resource_group_name" {
  type = string
  default = "aic-app-ntw-lo"
}

# to specify the location of where the app will run from.
variable "location" {
  type = string
  default = "UK South"
}

# Used to verfiy the address spce for the Virutal network the app will be use from.
variable "vnet_address_space" {
  description = "Address space for the Virtual Network (VNet)."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
