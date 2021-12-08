resource "azurerm_resource_group" "rg-fit-dev" {
  location = var.location
  name     = var.rgp_fit

  tags = merge(local.Common_tags, local.fit_tags)
  #tags = local.Common_tags    
}

resource "azurerm_app_service_plan" "fit_dev_asp" {
  name                = var.fit_dev_asp_name
  location            = azurerm_resource_group.rg-fit-dev.location
  resource_group_name = azurerm_resource_group.rg-fit-dev.name
  kind                = "windows"

  sku {
    tier = "PremiumV3"
    size = "P2v3"
  }
  tags = merge(local.Common_tags, local.fit_tags)
}

resource "azurerm_app_service" "fit_dev" {
  for_each            = var.fit_dev_webapp_name
  name                = "${each.key}-web-app"
  app_service_plan_id = azurerm_app_service_plan.fit_dev_asp.id
  resource_group_name = azurerm_resource_group.rg-fit-dev.name
  location            = azurerm_resource_group.rg-fit-dev.location
  app_settings = {
    "platform" = "value"
  }

  tags = merge(local.Common_tags, local.fit_tags)
}
/*commented due to vnet intergration issue
resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegrationconnection" {
  for_each       = azurerm_app_service.fit_dev
  app_service_id = azurerm_app_service.fit_dev[each.key].id
  subnet_id      = azurerm_subnet.subnet-dev-web.id
}
*/
resource "azurerm_private_endpoint" "fit_dev_pe" {
  for_each            = azurerm_app_service.fit_dev
  name                = "${each.key}-pe"
  location            = azurerm_resource_group.rg-fit-dev.location
  resource_group_name = azurerm_resource_group.rg-fit-dev.name
  subnet_id           = azurerm_subnet.subnet-dev-pe.id

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_app_service.fit_dev[each.key].id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}



resource "azurerm_app_service_plan" "fit_sit_asp" {
  name                = var.fit_sit_asp_name
  location            = azurerm_resource_group.rg-fit-dev.location
  resource_group_name = azurerm_resource_group.rg-fit-dev.name
  kind                = "windows"

  sku {
    tier = "PremiumV3"
    size = "P2v3"
  }
  tags = merge(local.Common_tags, local.fit_tags)
}

resource "azurerm_app_service" "fit_sit" {
  for_each            = var.fit_sit_webapp_name
  name                = "${each.key}-web-app"
  app_service_plan_id = azurerm_app_service_plan.fit_sit_asp.id
  resource_group_name = azurerm_resource_group.rg-fit-dev.name
  location            = azurerm_resource_group.rg-fit-dev.location
  app_settings = {
    "platform" = "value"
  }

  tags = merge(local.Common_tags, local.fit_tags)
}
/*commented due to vnet intergration issue
resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegrationconnection" {
  for_each       = azurerm_app_service.fit_sit
  app_service_id = azurerm_app_service.fit_sit[each.key].id
  subnet_id      = azurerm_subnet.subnet-dev-web.id
}
*/
resource "azurerm_private_endpoint" "fit_sit_pe" {
  for_each            = azurerm_app_service.fit_sit
  name                = "${each.key}-pe"
  location            = azurerm_resource_group.rg-fit-dev.location
  resource_group_name = azurerm_resource_group.rg-fit-dev.name
  subnet_id           = azurerm_subnet.subnet-dev-pe.id

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_app_service.fit_sit[each.key].id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}
