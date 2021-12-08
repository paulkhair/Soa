# azurerm_resource_group.rg-dev-db
# azurerm_network_security_group.nsg-dev-mongodb

resource "azurerm_network_interface" "nic-dev-lvm" {
  name                = "nic-dev-lvm-vmnic"
  location            = azurerm_resource_group.rg-dev-db.location
  resource_group_name = azurerm_resource_group.rg-dev-db.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-dev-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.mypublicip.id 
  }
}
resource "azurerm_network_interface" "nic-dev-lvm-2" {
  name                = "nic-dev-lvm-vmnic-2"
  location            = azurerm_resource_group.rg-dev-db.location
  resource_group_name = azurerm_resource_group.rg-dev-db.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-dev-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.mypublicip.id 
  }
}
resource "azurerm_linux_virtual_machine" "lvm-dev-monodb" {
  name                            = var.lvm-dev-mongo-name
  computer_name                   = var.lvm-dev-mongo-name
  resource_group_name             = azurerm_resource_group.rg-dev-db.name
  location                        = azurerm_resource_group.rg-dev-db.location
  size                            = var.lvm-dev-mongo-size
  admin_username                  = var.lvm-admin-username
  admin_password                  = var.lvm-admin-password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic-dev-lvm.id]
  # admin_ssh_key {
  #   username = "azureuser"
  #   public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  # }
  os_disk {
    name                 = "${var.lvm-dev-mongo-name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
  #custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}
resource "azurerm_managed_disk" "linux-managed-disk" {
  name                 = "${var.lvm-dev-mongo-name}-datadisk"
  location             = azurerm_resource_group.rg-dev-db.location
  resource_group_name  = azurerm_resource_group.rg-dev-db.name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = 2048
}


resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  managed_disk_id    = azurerm_managed_disk.linux-managed-disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.lvm-dev-monodb.id
  lun                = "10"
  caching            = "ReadWrite"
}

/*
resource "azurerm_linux_virtual_machine" "lvm-dev-mongodb-2" {
  name                            = var.lvm-dev-mongo-name-2
  computer_name                   = var.lvm-dev-mongo-name-2
  resource_group_name             = azurerm_resource_group.rg-dev-db.name
  location                        = azurerm_resource_group.rg-dev-db.location
  size                            = var.lvm-dev-mongo-size-2
  admin_username                  = var.lvm-admin-username
  admin_password                  = var.lvm-admin-password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic-dev-lvm-2.id]
  # admin_ssh_key {
  #   username = "azureuser"
  #   public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  # }
  os_disk {
    name                 = "${var.lvm-dev-mongo-name-2}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
  #custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}
*/


/*
resource "azurerm_linux_virtual_machine" "nginx-vm" {
  #count                 = 1
  depends_on          = [azurerm_network_interface.nginx-nic]
  name                = var.lvm-dev-mongo-name
  location            = azurerm_resource_group.rg-dev-db.location
  resource_group_name = azurerm_resource_group.rg-dev-db.name

  #network_interface_ids = [azurerm_network_interface.nginx-nic.id]
  size = var.lvm-dev-mongo-size
  source_image_reference {

    publisher = "RedHat"
    offer     = var.rhel-offer
    sku       = "7_8-gen2"
    version   = "latest"
  }
  os_disk {
    name                 = "nginx-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  computer_name                   = "nginx-vm"
  admin_username                  = var.nginx_admin_username
  admin_password                  = random_password.nginx-vm-password.result
  disable_password_authentication = false
  custom_data                     = base64encode(data.template_file.nginx-vm-cloud-init.rendered)
}
*/