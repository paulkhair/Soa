resource "azurerm_resource_group" "rg-dev-soa" {
  location = var.location
  name     = var.rgp_soa

  tags = merge(local.Common_tags, local.soa_tags)
  #tags = local.Common_tags    
}

resource "azurerm_app_service_plan" "dev-soa-asp" {
  name                = var.soa_dev_asp_name
  location            = azurerm_resource_group.rg-dev-soa.location
  resource_group_name = azurerm_resource_group.rg-dev-soa.name
  kind                = "windows"

  sku {
    tier = "PremiumV3"
    size = "P2v3"
  }
  tags = merge(local.Common_tags, local.soa_tags)
}

resource "azurerm_app_service" "dev_soa" {
  for_each            = var.soa_dev_webapp_name
  name                = "${each.key}-web-app"
  app_service_plan_id = azurerm_app_service_plan.dev-soa-asp.id
  resource_group_name = azurerm_resource_group.rg-dev-soa.name
  location            = azurerm_resource_group.rg-dev-soa.location
  app_settings = {
    "platform" = "value"
  }

  tags = merge(local.Common_tags, local.soa_tags)
}
/*commented due to vnet intergration issue
resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegrationconnection_dev_soa" {
  for_each       = azurerm_app_service.dev_soa
  app_service_id = azurerm_app_service.dev_soa[each.key].id
  subnet_id      = azurerm_subnet.subnet-dev-web.id
}
*/
resource "azurerm_private_endpoint" "dev_soa_pe" {
  for_each            = azurerm_app_service.dev_soa
  name                = "${each.key}-pe"
  location            = azurerm_resource_group.rg-dev-soa.location
  resource_group_name = azurerm_resource_group.rg-dev-soa.name
  subnet_id           = azurerm_subnet.subnet-dev-pe.id

  private_service_connection {
    name                           = "privateendpointconnection_dev_soa"
    private_connection_resource_id = azurerm_app_service.dev_soa[each.key].id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}
/*commented due to not supported 
resource "azurerm_monitor_autoscale_setting" "auto_scale_dev_soa" {
  name                = "myAutoscaleSetting_dev_soa"
  resource_group_name = azurerm_resource_group.rg-dev-soa.name
  location            = azurerm_resource_group.rg-dev-soa.location
  for_each            = azurerm_app_service.dev_soa
  target_resource_id  = azurerm_app_service.dev_soa[each.key].id
  profile {
    name = "default"
    capacity {
      default = 1
      minimum = 1
      maximum = 10
    }
    rule {
      metric_trigger {
        metric_name = "CpuPercentage"

        metric_resource_id = azurerm_app_service.dev_soa[each.key].id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 70
      }
      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = azurerm_app_service.dev_soa[each.key].id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 10
      }
      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }
}
*/

resource "azurerm_app_service_plan" "sit-soa-asp" {
  name                = var.soa_sit_asp_name
  location            = azurerm_resource_group.rg-dev-soa.location
  resource_group_name = azurerm_resource_group.rg-dev-soa.name
  kind                = "windows"

  sku {
    tier = "PremiumV3"
    size = "P2v3"
  }
  tags = merge(local.Common_tags, local.soa_tags)
}

resource "azurerm_app_service" "sit_soa" {
  for_each            = var.soa_sit_webapp_name
  name                = "${each.key}-web-app"
  app_service_plan_id = azurerm_app_service_plan.sit-soa-asp.id
  resource_group_name = azurerm_resource_group.rg-dev-soa.name
  location            = azurerm_resource_group.rg-dev-soa.location
  app_settings = {
    "platform" = "value"
  }

  tags = merge(local.Common_tags, local.soa_tags)
}
/*commented due to vnet intergration issue
resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegrationconnection_soa_sit" {
  for_each       = azurerm_app_service.sit_soa
  app_service_id = azurerm_app_service.sit_soa[each.key].id
  subnet_id      = azurerm_subnet.subnet-dev-web.id
}
*/
resource "azurerm_private_endpoint" "sit_soa_pe" {
  for_each            = azurerm_app_service.sit_soa
  name                = "${each.key}-pe"
  location            = azurerm_resource_group.rg-dev-soa.location
  resource_group_name = azurerm_resource_group.rg-dev-soa.name
  subnet_id           = azurerm_subnet.subnet-dev-pe.id

  private_service_connection {
    name                           = "privateendpointconnection_sit_soa"
    private_connection_resource_id = azurerm_app_service.sit_soa[each.key].id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}


/* 

resource "azurerm_resource_group" "myrg" {
  for_each = toset([ "eastus", "eastus2", "westus" ])
  name = "myrg-${each.value}"
  location = each.key 
}


we can also use each.value as each.key = each.value 
in this case  
*/