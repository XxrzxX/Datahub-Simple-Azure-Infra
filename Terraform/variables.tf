#========================= Subseciption var =======================
variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}

#======================= Recourse group var  =======================
variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}

#=======================  Vnet module var  =======================
variable "Vnet_Name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "VM_subnet" {
  description = "Name of the Subnet for vm "
  type        = string
} 

#======================= VM module var =======================
variable "VM" {
  description = "Virtual machine (VM) Name"
  type        = string
}

variable "adminUserName" {
  description = "Username for the ssh admin key"
  type        = string
}

