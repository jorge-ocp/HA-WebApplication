output "linux_public_ip_output" {
  value = azurerm_public_ip.linux_pubip.ip_address
}
