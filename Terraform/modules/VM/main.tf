# Virtual Machine module 
#============================= Public IP =============================================#
resource "azurerm_public_ip" "amundsenPublicIp" {
  name                    = local.vm_public_ip
  resource_group_name     = var.resource_group_name
  location                = var.location
  allocation_method       = "Static"
  
  tags = {
    environment = "production"
    name = "Cross-SDAProject"
  }
}

#============================= Network Interface =============================================#
# Create a network interface for the VM
resource "azurerm_network_interface" "VmNic" {
  name                   = local.nic_name
  location               = var.location
  resource_group_name    = var.resource_group_name

  ip_configuration {
    name                             = "internal"
    subnet_id                        = var.VMSubnet_id
    private_ip_address_allocation    = "Dynamic"
    public_ip_address_id             = azurerm_public_ip.amundsenPublicIp.id
  }

  tags = {
    environment = "production"
    name = "Cross-SDAProject"
  }
}

#============================= VM (amundsen) =============================================#
resource "azurerm_linux_virtual_machine" "amundsen_vm" {
  name                    = var.VM
  resource_group_name     = var.resource_group_name
  location                = var.location
  size                    = "Standard_D2s_v3"
  admin_username          = var.adminUserName

  network_interface_ids   = [azurerm_network_interface.VmNic.id,]


  admin_ssh_key {
    username              = var.adminUserName
    public_key            = file("${path.module}/../../SSHKeys/VM.pub")
  }

  os_disk {
    caching               = "ReadWrite"
    storage_account_type  = "Standard_LRS"
  }

  source_image_reference {
    publisher             = "Canonical"
    offer                 = "0001-com-ubuntu-server-jammy"
    sku                   = "22_04-lts"
    version               = "latest"
  }

  custom_data = base64encode(file("${path.module}/../../Setup_Scripts/VM_setup.sh"))
  
  
  tags = {
    environment = "production"
    name = "Cross-SDAProject"
  }
}


