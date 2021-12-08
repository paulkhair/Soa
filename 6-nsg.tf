######################### Mongo DB NSG rules ##########################################3
resource "azurerm_network_security_group" "nsg-dev-mongodb" {
  name                = "nsg_dev_mongodb"
  location            = azurerm_resource_group.rg-dev-db.location
  resource_group_name = azurerm_resource_group.rg-dev-db.name
  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    description                = ""
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    description                = "Allow Mongo Port"
    destination_address_prefix = "*"
    destination_port_range     = "27017"
    name                       = "AllOW - Mongo Port"
    priority                   = 111
    protocol                   = "TCP"
    source_address_prefix      = "*"
    source_port_range          = "*"

  }
  tags = merge(local.Common_tags, local.db_tags, )
}

resource "azurerm_subnet_network_security_group_association" "nsg-dev-mondb-asso" {
  #Sdepends_on                = azurerm_resource_group.rg-dev-db
  subnet_id                 = azurerm_subnet.subnet-dev-vm-subnet.id
  network_security_group_id = azurerm_network_security_group.nsg-dev-mongodb.id
}
# azurerm_resource_group.rg-dev-db
# azurerm_network_security_group.nsg-dev-mongodb
###############################          ############################






/*
resource "azurerm_network_security_group" "nsg-dev-soa" {
  name                = var.nonprod_nsg_name
  location            = azurerm_resource_group.rg-dev-nonprod.location
  resource_group_name = azurerm_resource_group.rg-dev-nonprod.name

  security_rule {
    name                       = "allow RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389" #"*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow_management_inbound"
    priority                   = 106
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["9000", "9003", "1438", "1440", "1452"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow_misubnet_inbound"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "172.16.0.0/16"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow_tds_inbound"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1433"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
  }
  security_rule {
    name                    = "allow_management_outbound"
    priority                = 102
    direction               = "Outbound"
    access                  = "Allow"
    protocol                = "Tcp"
    source_port_range       = "*"
    destination_port_ranges = ["80", "443", "12000"]
    #destination_port_range     = ["80", "443", "12000"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

######################### Mongo DB NSG rules ##########################################3
resource "azurerm_network_security_group" "nsg-dev-mongodb" {
  name                = "nsg_dev_mongodb"
  location            = azurerm_resource_group.rg-dev-db.location
  resource_group_name = azurerm_resource_group.rg-dev-db.name
  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    access                     = "allow"
    direction                  = "Inbound"
    description                = "Allow HTTP"
    destination_address_prefix = "*"
    destination_port_range     = "80"
    name                       = "AllOW - HTTP"
    priority                   = 110
    protocol                   = "TCP"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }

  security_rule {
    access                     = "allow"
    direction                  = "Inbound"
    description                = "Allow HTTPS"
    destination_address_prefix = "*"
    destination_port_range     = "443"
    name                       = "AllOW - HTTPS"
    priority                   = 111
    protocol                   = "TCP"
    source_address_prefix      = "*"
    source_port_range          = "*"

  }
  tags = merge(local.Common_tags, local.db_tags, )
}

resource "azurerm_subnet_network_security_group_association" "nsg-dev-mondb-asso" {
  #Sdepends_on                = azurerm_resource_group.rg-dev-db
  subnet_id                 = var.dev_vm_subnet_name.id
  network_security_group_id = azurerm_network_security_group.nsg-dev-mongodb.id
}
# azurerm_resource_group.rg-dev-db
# azurerm_network_security_group.nsg-dev-mongodb
###############################          ############################
*/
