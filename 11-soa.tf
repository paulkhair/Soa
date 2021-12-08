resource "azurerm_resource_group" "rg-dev-soa" {
  location = var.location
  name     = var.rgp_soa

  tags = merge(local.Common_tags, local.soa_tags)

}

resource "azurerm_app_service_plan" "soa-dev-asp" {
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

resource "azurerm_app_service" "soa_dev" {
  for_each = var.soa_dev_webapp_name
  name     = "${each.key}-${var.env[0]}"
  #name                = "${each.key}-${var.env}"
  app_service_plan_id = azurerm_app_service_plan.soa-dev-asp.id
  resource_group_name = azurerm_resource_group.rg-dev-soa.name
  location            = azurerm_resource_group.rg-dev-soa.location
  app_settings = {
    "platform" = "value"
  }

  tags = merge(local.Common_tags, local.soa_tags)
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegrationconnection_soa_dev" {
  for_each       = azurerm_app_service.soa_dev
  app_service_id = azurerm_app_service.soa_dev[each.key].id
  subnet_id      = azurerm_subnet.subnet-dev-vi-soa-dev.id

}

resource "azurerm_private_endpoint" "soa_dev_pe" {
  for_each            = azurerm_app_service.soa_dev
  name                = "${each.key}-pe"
  location            = azurerm_resource_group.rg-dev-soa.location
  resource_group_name = azurerm_resource_group.rg-dev-soa.name
  subnet_id           = azurerm_subnet.subnet-dev-pe-subnet.id

  private_dns_zone_group {
    name                 = "privatednszonegroup"
    private_dns_zone_ids = [azurerm_private_dns_zone.private-dns-zone.id]
  }


  private_service_connection {
    name                           = "privateendpointconnection_soa_dev"
    private_connection_resource_id = azurerm_app_service.soa_dev[each.key].id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  tags = merge(local.Common_tags, local.soa_tags)
}

resource "azurerm_monitor_autoscale_setting" "auto_scale_soa_dev_asp" {
  name                = "myAutoscaleSetting_soa_dev"
  resource_group_name = azurerm_resource_group.rg-dev-soa.name
  location            = azurerm_resource_group.rg-dev-soa.location
  target_resource_id  = azurerm_app_service_plan.soa-dev-asp.id
  profile {
    name = "default"
    capacity {
      default = 1
      minimum = 1
      maximum = 3
    }
    rule {
      metric_trigger {
        metric_name = "CpuPercentage"

        metric_resource_id = azurerm_app_service_plan.soa-dev-asp.id
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
        metric_resource_id = azurerm_app_service_plan.soa-dev-asp.id
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


######################################## SOA SIT ####################################################3

resource "azurerm_app_service_plan" "soa-sit-asp" {
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

resource "azurerm_app_service" "soa_sit" {
  for_each            = var.soa_sit_webapp_name
  name                = "${each.key}-${var.env[1]}"
  app_service_plan_id = azurerm_app_service_plan.soa-sit-asp.id
  resource_group_name = azurerm_resource_group.rg-dev-soa.name
  location            = azurerm_resource_group.rg-dev-soa.location
  app_settings = {
    "platform" = "value"
  }

  tags = merge(local.Common_tags, local.soa_tags)
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegrationconnection_soa_sit" {
  for_each       = azurerm_app_service.soa_sit
  app_service_id = azurerm_app_service.soa_sit[each.key].id
  subnet_id      = azurerm_subnet.subnet-dev-vi-soa-sit.id

}

resource "azurerm_private_endpoint" "soa_sit_pe" {
  for_each            = azurerm_app_service.soa_sit
  name                = "${each.key}-pe"
  location            = azurerm_resource_group.rg-dev-soa.location
  resource_group_name = azurerm_resource_group.rg-dev-soa.name
  subnet_id           = azurerm_subnet.subnet-dev-pe-subnet.id

  private_dns_zone_group {
    name                 = "privatednszonegroup"
    private_dns_zone_ids = [azurerm_private_dns_zone.private-dns-zone.id]
  }



  private_service_connection {
    name                           = "privateendpointconnection_soa_sit"
    private_connection_resource_id = azurerm_app_service.soa_sit[each.key].id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  tags = merge(local.Common_tags, local.soa_tags)
}

resource "azurerm_monitor_autoscale_setting" "auto_scale__asp" {
  name                = "myAutoscaleSetting_soa_sit"
  resource_group_name = azurerm_resource_group.rg-dev-soa.name
  location            = azurerm_resource_group.rg-dev-soa.location
  target_resource_id  = azurerm_app_service_plan.soa-sit-asp.id
  profile {
    name = "default"
    capacity {
      default = 1
      minimum = 1
      maximum = 3
    }
    rule {
      metric_trigger {
        metric_name = "CpuPercentage"

        metric_resource_id = azurerm_app_service_plan.soa-sit-asp.id
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
        metric_resource_id = azurerm_app_service_plan.soa-sit-asp.id
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