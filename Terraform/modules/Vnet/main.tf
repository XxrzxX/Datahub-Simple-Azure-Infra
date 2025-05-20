# Virtual Network (VNet) module

# Virtual Network (VNet) Configuration
resource "azurerm_virtual_network" "Vnet" {
  name                    = var.Vnet_Name
  address_space           = ["10.0.0.0/16"]
  location                = var.location
  resource_group_name     = var.resource_group_name
  
  tags = {
    environment = "production"
    name = "Cross-SDAProject"
  }
}
#============================== Subnets ============================================
resource "azurerm_subnet" "VMSubnet" {
  name                     = var.VM_subnet
  resource_group_name      = var.resource_group_name
  virtual_network_name     = azurerm_virtual_network.Vnet.name
  address_prefixes         = ["10.0.0.0/24"]
  
}

#============================== NGS ============================================

resource "azurerm_network_security_group" "VmNsg" {
  name                       = local.network_security_group_name
  location                   = var.location
  resource_group_name        = var.resource_group_name

  security_rule {
    name                         = "allow-ssh"
    priority                     = 100
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "Tcp"
    source_port_range            = "*"
    destination_port_range       = "22"
    source_address_prefix        = "*"
    destination_address_prefix   = "*"
  }
  security_rule {
    name                         = "allow-frontend"
    priority                     = 200
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "*"
    source_port_range            = "*"
    destination_port_range       = "9002"
    source_address_prefix        = "*"
    destination_address_prefix   = "*"
  }

  tags = {
    environment = "production"
    name = "Cross-SDAProject"
  }

}

# NGS Association 
resource "azurerm_subnet_network_security_group_association" "nsg-association" {
  subnet_id                  = azurerm_subnet.VMSubnet.id
  network_security_group_id  = azurerm_network_security_group.VmNsg.id
  
}
