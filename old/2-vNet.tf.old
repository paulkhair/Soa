resource "azurerm_virtual_network" "vnt-dev1" {
  name                = var.vnt_nonprod
  address_space       = var.nonprod_virtual_network_address_space
  location            = azurerm_resource_group.rg-dev-nonprod.location
  resource_group_name = azurerm_resource_group.rg-dev-nonprod.name



  tags = merge(local.Common_tags, local.nonprod_tags)
}

resource "azurerm_subnet" "subnet-dev-db" {
  name                 = var.dev_db_subnet_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_db_subnet_address_space

  delegation {
    name = "managedinstancedelegation"

    service_delegation {
      name    = "Microsoft.Sql/managedInstances"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    }
  }

  depends_on = [
    azurerm_virtual_network.vnt-dev1
  ]
}
resource "azurerm_subnet" "subnet-dev-web" {
  name                 = var.dev_web_subnet_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_web_subnet_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev1
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }

}
resource "azurerm_subnet" "subnet-dev-pe" {
  name                                           = var.dev_pe_subnet_name
  resource_group_name                            = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name                           = var.vnt_nonprod
  address_prefixes                               = var.dev_pe_subnet_address_space
  enforce_private_link_endpoint_network_policies = true
  #enforce_private_link_service_network_policies  = false

  depends_on = [
    azurerm_virtual_network.vnt-dev1
  ]
}
resource "azurerm_subnet" "subnet-dev-gw" {
  name                 = var.dev_gw_subnet_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_gw_subnet_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev1
  ]
}
resource "azurerm_subnet" "subnet-uat-db" {
  name                 = var.uat_db_subnet_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.uat_db_subnet_address_space

  delegation {
    name = "managedinstancedelegation"

    service_delegation {
      name    = "Microsoft.Sql/managedInstances"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    }
  }

  depends_on = [
    azurerm_virtual_network.vnt-dev1
  ]
}
resource "azurerm_subnet" "subnet-uat-web" {
  name                 = var.uat_web_subnet_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.uat_web_subnet_address_space
  depends_on = [
    azurerm_virtual_network.vnt-dev1
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }

}
resource "azurerm_subnet" "subnet-uat-pe" {
  name                                           = var.uat_pe_subnet_name
  resource_group_name                            = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name                           = var.vnt_nonprod
  address_prefixes                               = var.uat_pe_subnet_address_space
  enforce_private_link_endpoint_network_policies = true
  #enforce_private_link_service_network_policies  = false
  depends_on = [
    azurerm_virtual_network.vnt-dev1
  ]
}
resource "azurerm_subnet" "subnet-uat-gw" {
  name                 = var.uat_gw_subnet_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.uat_gw_subnet_address_space
  depends_on = [
    azurerm_virtual_network.vnt-dev1
  ]
}



/*
# this subnet has delegations to Microsoft.web/servFarms
resource "azurerm_subnet" "subnet-dev-web" {
  name                 = "${var.dev_web_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg-dev1[0].name
  virtual_network_name = azurerm_virtual_network.vnt-dev1.name
  address_prefixes     = var.dev_web_subnet_address_space
  
  delegation {
    name = "delegation"
    service_delegation {
      name= "Microsoft.Web/serverFarms"
    }
  }
  
}

#make a note enforce_private_link_endpoint_network_policies are set as true
resource "azurerm_subnet" "subnet-dev-pe" {
  name                 = "${var.dev_pe_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg-dev1[0].name
  virtual_network_name = azurerm_virtual_network.vnt-dev1.name
  address_prefixes     = var.dev_pe_subnet_address_space
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "subnet-dev-gw" {
  name                 = "${var.dev_gw_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg-dev1[0].name
  virtual_network_name = azurerm_virtual_network.vnt-dev1.name
  address_prefixes     = var.dev_gw_subnet_address_space
}
resource "azurerm_subnet" "subnet-uat-db" {
  name                 = "${var.uat_db_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg-dev1[0].name
  virtual_network_name = azurerm_virtual_network.vnt-dev1.name
  address_prefixes     = var.uat_db_subnet_address_space
}

# this subnet has delegations to Microsoft.web/servFarms
resource "azurerm_subnet" "subnet-uat-web" {
  name                 = "${var.uat_web_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg-dev1[0].name
  virtual_network_name = azurerm_virtual_network.vnt-dev1.name
  address_prefixes     = var.uat_web_subnet_address_space
  
  delegation {
    name = "delegation"
    service_delegation {
      name= "Microsoft.Web/serverFarms"
    }
  }
}

#make a note enforce_private_link_endpoint_network_policies are set as true
resource "azurerm_subnet" "subnet-uat-pe" {
  name                 = "${var.uat_pe_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg-dev1[0].name
  virtual_network_name = azurerm_virtual_network.vnt-dev1.name
  address_prefixes     = var.uat_pe_subnet_address_space
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "subnet-uat-gw" {
  name                 = "${var.uat_gw_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg-dev1[0].name
  virtual_network_name = azurerm_virtual_network.vnt-dev1.name
  address_prefixes     = var.uat_gw_subnet_address_space
}
*/
/*
resource "azurerm_virtual_network_peering" "example-1" {
  name                      = "azvntsoan0002-peer-azvnthub002"
  resource_group_name       = var.rgp_nonprod
  virtual_network_name      = var.vnt_nonprod
  remote_virtual_network_id = var.hub_virtual_network_id
}



*/