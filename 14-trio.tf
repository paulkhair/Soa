resource "azurerm_resource_group" "rg-trio-dev" {
  location = var.location
  name     = var.rgp_trio

  tags = merge(local.Common_tags, local.trio_tags)
  #tags = local.Common_tags    
}

resource "azurerm_app_service_plan" "trio_dev_asp" {
  name                = var.trio_dev_asp_name
  location            = azurerm_resource_group.rg-trio-dev.location
  resource_group_name = azurerm_resource_group.rg-trio-dev.name
  kind                = "windows"

  sku {
    tier = "PremiumV3"
    size = "P2v3"
  }
  tags = merge(local.Common_tags, local.trio_tags)
}

resource "azurerm_app_service" "trio_dev" {
  for_each            = var.trio_dev_webapp_name
  name                = "${each.key}-web-app"
  app_service_plan_id = azurerm_app_service_plan.trio_dev_asp.id
  resource_group_name = azurerm_resource_group.rg-trio-dev.name
  location            = azurerm_resource_group.rg-trio-dev.location
  app_settings = {
    "platform" = "value"
  }

  tags = merge(local.Common_tags, local.trio_tags)
}
/*commented due to vnet intergration issue
resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegrationconnection" {
  for_each       = azurerm_app_service.trio_dev
  app_service_id = azurerm_app_service.trio_dev[each.key].id
  subnet_id      = azurerm_subnet.subnet-dev-web.id
}
*/
resource "azurerm_private_endpoint" "trio_dev_pe" {
  for_each            = azurerm_app_service.trio_dev
  name                = "${each.key}-pe"
  location            = azurerm_resource_group.rg-trio-dev.location
  resource_group_name = azurerm_resource_group.rg-trio-dev.name
  subnet_id           = azurerm_subnet.subnet-dev-pe.id

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_app_service.trio_dev[each.key].id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}



resource "azurerm_app_service_plan" "trio_sit_asp" {
  name                = var.trio_sit_asp_name
  location            = azurerm_resource_group.rg-trio-dev.location
  resource_group_name = azurerm_resource_group.rg-trio-dev.name
  kind                = "windows"

  sku {
    tier = "PremiumV3"
    size = "P2v3"
  }
  tags = merge(local.Common_tags, local.trio_tags)
}

resource "azurerm_app_service" "trio_sit" {
  for_each            = var.trio_sit_webapp_name
  name                = "${each.key}-web-app"
  app_service_plan_id = azurerm_app_service_plan.trio_sit_asp.id
  resource_group_name = azurerm_resource_group.rg-trio-dev.name
  location            = azurerm_resource_group.rg-trio-dev.location
  app_settings = {
    "platform" = "value"
  }

  tags = merge(local.Common_tags, local.trio_tags)
}
/*commented due to vnet intergration issue
resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegrationconnection" {
  for_each       = azurerm_app_service.trio_sit
  app_service_id = azurerm_app_service.trio_sit[each.key].id
  subnet_id      = azurerm_subnet.subnet-dev-web.id
}
*/
resource "azurerm_private_endpoint" "trio_sit_pe" {
  for_each            = azurerm_app_service.trio_sit
  name                = "${each.key}-pe"
  location            = azurerm_resource_group.rg-trio-dev.location
  resource_group_name = azurerm_resource_group.rg-trio-dev.name
  subnet_id           = azurerm_subnet.subnet-dev-pe.id

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_app_service.trio_sit[each.key].id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}
