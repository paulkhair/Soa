resource "azurerm_storage_account" "sta-nonprod" {
  account_replication_type = "GZRS"
  account_tier             = "Standard"
  location                 = azurerm_resource_group.rg-dev-nonprod.location
  name                     = var.nonprod_storage_account
  resource_group_name      = azurerm_resource_group.rg-dev-nonprod.name
  allow_blob_public_access = false
  account_kind             = "StorageV2"



  tags = merge(local.Common_tags, local.nonprod_tags)

}

resource "azurerm_storage_container" "nonprod_container" {
  name                  = var.nonprod_cotainer_name
  storage_account_name  = var.nonprod_storage_account
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.sta-nonprod
  ]
}

resource "azurerm_private_endpoint" "nonprod_storage_pe" {
  name                = var.nonprod_storage_pe_name
  location            = azurerm_resource_group.rg-dev-nonprod.location
  resource_group_name = azurerm_resource_group.rg-dev-nonprod.name
  subnet_id           = azurerm_subnet.subnet-uat-pe.id

  private_service_connection {
    name                           = var.nonprod_private_service_connection_name
    is_manual_connection           = false
    private_connection_resource_id = azurerm_storage_account.sta-nonprod.id
    subresource_names              = ["blob"]
  }

}