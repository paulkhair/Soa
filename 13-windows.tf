resource "azurerm_network_interface" "nic-dev-wvm" {
  name                = "nic-dev-wvm-vmnic"
  location            = azurerm_resource_group.rg-dev-db.location
  resource_group_name = azurerm_resource_group.rg-dev-db.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-dev-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_windows_virtual_machine" "wvm-dev-mgmt" {
  name                = var.wvm-dev-mgmt-name
  location            = azurerm_resource_group.rg-dev-db.location
  resource_group_name = azurerm_resource_group.rg-dev-db.name
  size                = var.wvm-dev-mgmt-size
  admin_username      = var.wvm-admin-username
  admin_password      = var.wvm-admin-password
  network_interface_ids = [
    azurerm_network_interface.nic-dev-wvm.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  tags = merge(local.Common_tags, local.nonprod_tags)
}

resource "azurerm_dev_test_global_vm_shutdown_schedule" "wvm-dev-mgmt-sche" {

  virtual_machine_id = azurerm_windows_virtual_machine.wvm-dev-mgmt.id
  location           = azurerm_resource_group.rg-dev-db.location
  enabled            = true

  daily_recurrence_time = "2200"
  timezone              = "India Standard Time"


  notification_settings {
    enabled         = true
    time_in_minutes = "60"
    webhook_url     = "https://sample-webhook-url.example.com"
  }


}