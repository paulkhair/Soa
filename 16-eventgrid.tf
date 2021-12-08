resource "azurerm_eventgrid_domain" "eventgrid" {
  name                = var.eventgriddomain
  location            = azurerm_resource_group.rg-dev-nonprod.location
  resource_group_name = azurerm_resource_group.rg-dev-nonprod.name

  tags = merge(local.Common_tags, local.nonprod_tags)
}