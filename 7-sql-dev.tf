resource "azurerm_resource_group" "rg-dev-db" {
  location = var.location
  name     = var.rgp_db

  tags = merge(local.Common_tags, local.db_tags)
  #tags = local.Common_tags    
}

resource "azurerm_route_table" "rt-dev-soa" {
  name                          = "routetable-dev-soa-sql-mi"
  location                      = azurerm_resource_group.rg-dev-db.location
  resource_group_name           = azurerm_resource_group.rg-dev-db.name
  disable_bgp_route_propagation = false
  depends_on = [
    var.azure_
  ]
}

resource "azurerm_subnet_route_table_association" "example" {
  subnet_id      = azurerm_subnet.example.id
  route_table_id = azurerm_subnet.subnet-dev-db.id 
  azurerm_subnet.subnet-uat-db.id
}



resource "azurerm_sql_managed_instance" "dev_soa_sqlmi" {
  name                         = "managedsqlinstance"
  resource_group_name          = azurerm_resource_group.rg-dev-db.name
  location                     = azurerm_resource_group.rg-dev-db.location
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"
  license_type                 = "BasePrice"
  subnet_id                    = azurerm_subnet.subnet-dev-db.id
  sku_name                     = "GP_Gen5"
  vcores                       = 16
  storage_size_in_gb           = 2400

  depends_on = [
    azurerm_network_security_group.nsg-dev-soa,
    azurerm_subnet_route_table_association.example,
  ]
}
