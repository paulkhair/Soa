resource "azurerm_resource_group" "rg-dev-db" {
  location = var.location
  name     = var.rgp_db

  tags = merge(local.Common_tags, local.db_tags, )
  #tags = local.Common_tags    
}

resource "azurerm_network_security_group" "nsg-dev-db" {
  name                = "sql-dev-nsg"
  location            = azurerm_resource_group.rg-dev-db.location
  resource_group_name = azurerm_resource_group.rg-dev-db.name
  tags                = merge(local.Common_tags, local.db_tags, )
}

resource "azurerm_network_security_rule" "allow_management_inbound" {
  name                        = "allow_management_inbound"
  priority                    = 106
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["9000", "9003", "1438", "1440", "1452"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-dev-db.name
  network_security_group_name = azurerm_network_security_group.nsg-dev-db.name

}

resource "azurerm_network_security_rule" "allow_misubnet_inbound" {
  name                        = "allow_misubnet_inbound"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "10.0.0.0/24"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-dev-db.name
  network_security_group_name = azurerm_network_security_group.nsg-dev-db.name
}

resource "azurerm_network_security_rule" "allow_health_probe_inbound" {
  name                        = "allow_health_probe_inbound"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-dev-db.name
  network_security_group_name = azurerm_network_security_group.nsg-dev-db.name
}

resource "azurerm_network_security_rule" "allow_tds_inbound" {
  name                        = "allow_tds_inbound"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-dev-db.name
  network_security_group_name = azurerm_network_security_group.nsg-dev-db.name
}

resource "azurerm_network_security_rule" "deny_all_inbound" {
  name                        = "deny_all_inbound"
  priority                    = 4096
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-dev-db.name
  network_security_group_name = azurerm_network_security_group.nsg-dev-db.name
}

resource "azurerm_network_security_rule" "allow_management_outbound" {
  name                        = "allow_management_outbound"
  priority                    = 102
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443", "12000"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-dev-db.name
  network_security_group_name = azurerm_network_security_group.nsg-dev-db.name
}

resource "azurerm_network_security_rule" "allow_misubnet_outbound" {
  name                        = "allow_misubnet_outbound"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "10.0.0.0/24"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-dev-db.name
  network_security_group_name = azurerm_network_security_group.nsg-dev-db.name
}

resource "azurerm_network_security_rule" "deny_all_outbound" {
  name                        = "deny_all_outbound"
  priority                    = 107
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-dev-db.name
  network_security_group_name = azurerm_network_security_group.nsg-dev-db.name
}

resource "azurerm_network_security_rule" "sqlmi_dev_inbound" {
  name                        = "sqlmi_dev_inbound"
  priority                    = 4095
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_ranges     = ["3342", "11000-11999"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-dev-db.name
  network_security_group_name = azurerm_network_security_group.nsg-dev-db.name
}


resource "azurerm_route_table" "rt-dev-soa-db" {
  name                          = "routetable-dev-soa-sql-mi"
  location                      = azurerm_resource_group.rg-dev-db.location
  resource_group_name           = azurerm_resource_group.rg-dev-db.name
  disable_bgp_route_propagation = false
  tags                          = merge(local.Common_tags, local.db_tags, )

}

resource "azurerm_subnet_route_table_association" "rt-db-dev" {
  subnet_id      = azurerm_subnet.subnet-dev-db.id
  route_table_id = azurerm_route_table.rt-dev-soa-db.id

}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.subnet-dev-db.id
  network_security_group_id = azurerm_network_security_group.nsg-dev-db.id
}


resource "azurerm_sql_managed_instance" "dev_soa_sqlmi" {
  count                        = 2
  name                         = "azsmisoan000${count.index + 1}" #"azsmisoan0001"
  resource_group_name          = azurerm_resource_group.rg-dev-db.name
  location                     = azurerm_resource_group.rg-dev-db.location
  administrator_login          = var.sqlmi-dev-admin-name
  administrator_login_password = var.sqlmi-dev-password
  license_type                 = "BasePrice"
  subnet_id                    = azurerm_subnet.subnet-dev-db.id
  sku_name                     = "GP_Gen5"
  vcores                       = 16
  storage_size_in_gb           = 2400

  depends_on = [
    azurerm_network_security_group.nsg-dev-db,
    azurerm_subnet_route_table_association.rt-db-dev,
  ]

  tags = merge(local.Common_tags, local.db_tags, )

}


#################################### Dev env DB storage ########################
resource "azurerm_storage_account" "sta-dev-dba" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = azurerm_resource_group.rg-dev-db.location
  name                     = var.sta-dev-db
  resource_group_name      = azurerm_resource_group.rg-dev-db.name
  allow_blob_public_access = false
  account_kind             = "StorageV2"



  tags = merge(local.Common_tags, local.db_tags)

}

resource "azurerm_storage_container" "dev-db-container" {
  name                  = "dev-db"
  storage_account_name  = azurerm_storage_account.sta-dev-dba.name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.sta-dev-dba
  ]
}



resource "azurerm_data_factory" "dev-adf-001" {
  name                = var.adf-dev-name
  location            = azurerm_resource_group.rg-dev-db.location
  resource_group_name = azurerm_resource_group.rg-dev-db.name

  tags = merge(local.Common_tags, local.db_tags)

}
