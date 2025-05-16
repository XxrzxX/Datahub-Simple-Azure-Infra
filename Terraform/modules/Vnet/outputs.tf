# Virtual Network (VNet) outputs

output "VMSubnet_id" {
  value = azurerm_subnet.VMSubnet.id
}

output "Vnet_name" {
  value = azurerm_virtual_network.Vnet.name
}
