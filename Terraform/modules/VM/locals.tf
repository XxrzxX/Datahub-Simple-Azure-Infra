# Virtual Machine Locals

locals {
  nic_name     = "${var.VM}-nic"
  vm_public_ip = "${var.VM}-ip"
}