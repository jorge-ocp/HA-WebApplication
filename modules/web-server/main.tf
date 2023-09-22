resource "azurerm_network_interface" "linux-vm-nic" {
  name                = "${var.vm_name}-nic"
  resource_group_name = var.resource_group
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_pubip.id
    #private_ip_address = "10.0.2.10"
  }

}

resource "azurerm_public_ip" "linux_pubip" {
  name                = "${var.vm_name}-public-ip"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Static"

}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  name                            = var.vm_name
  resource_group_name             = var.resource_group
  location                        = var.location
  size                            = local.instance_types[terraform.workspace]
  admin_username                  = var.adminusername
  admin_password                  = var.adminpassword
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.linux-vm-nic.id,
  ]

  /*  admin_ssh_key {
    username   = var.adminusername
    public_key = file("~/.ssh/linux-vm-2.pub")
  } */

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  tags = {
    "role" = "webserver"
  }
}
