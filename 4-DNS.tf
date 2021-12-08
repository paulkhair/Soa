resource "azurerm_private_dns_zone" "private-dns-zone" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = azurerm_resource_group.rg-dev-nonprod.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "pdnszonelink" {
  name                  = "pdnszonelink"
  resource_group_name   = azurerm_resource_group.rg-dev-nonprod.name
  private_dns_zone_name = azurerm_private_dns_zone.private-dns-zone.name
  virtual_network_id    = azurerm_virtual_network.vnt-dev-nonprod.id #azurerm_virtual_network.vnt-dev-nonprod.id
  registration_enabled  = false
}


/*
# private DNS
resource "azurerm_private_dns_zone" "example" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = data.azurerm_resource_group.rg.name
}

#private DNS Link
resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "${azurerm_app_service.frontend.name}-dnslink"
  resource_group_name   = data.azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.example.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  registration_enabled = false
}
*/