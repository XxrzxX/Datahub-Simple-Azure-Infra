#=========================Resources Group=====================================
resource "azurerm_resource_group" "RG" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = "production"
    name = "SDAProject"
  }
}

#=========================Modules===========================================#

#========================= Vnet ======================================#
module "Vnet" {
  source                          = "./modules/Vnet"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  Vnet_Name                       = var.Vnet_Name
  VM_subnet                       = var.VM_subnet
  VM                              = var.VM

  depends_on                      = [azurerm_resource_group.RG]
  }

#========================= VM ===========================================#
module "VM" {
  source                          = "./modules/VM"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  VMSubnet_id                     = module.Vnet.VMSubnet_id
  VM                              = var.VM
  adminUserName                   = var.adminUserName

  depends_on                      = [azurerm_resource_group.RG,module.Vnet]
}
