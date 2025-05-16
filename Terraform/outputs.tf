#========================= VM ===============================
output "VM_public_ip_address" {
  value = module.VM.VM_public_ip_address
}

output "VM_private_ip_address" {
  value = module.VM.VM_private_ip_address
}

output "VM_name" {
  value = module.VM.VM
}