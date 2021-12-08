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