resource "azurerm_virtual_network" "vnt-dev-nonprod" {
  name                = var.vnt_nonprod
  address_space       = var.nonprod_virtual_network_address_space
  location            = azurerm_resource_group.rg-dev-nonprod.location
  resource_group_name = azurerm_resource_group.rg-dev-nonprod.name
  dns_servers         = var.vnt_dns_servers

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
    azurerm_virtual_network.vnt-dev-nonprod
  ]
}

resource "azurerm_subnet" "subnet-dev-vi-soa-dev" {
  name                 = var.dev_vi_soa_dev_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_soa_dev_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}
resource "azurerm_subnet" "subnet-dev-vi-soa-sit" {
  name                 = var.dev_vi_soa_sit_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_soa_sit_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}

resource "azurerm_subnet" "subnet-dev-vi-fit-dev" {
  name                 = var.dev_vi_fit_dev_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_fit_dev_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}
resource "azurerm_subnet" "subnet-dev-vi-fit-sit" {
  name                 = var.dev_vi_fit_sit_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_fit_sit_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}

resource "azurerm_subnet" "subnet-dev-vi-ptc-dev" {
  name                 = var.dev_vi_ptc_dev_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_ptc_dev_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}
resource "azurerm_subnet" "subnet-dev-vi-ptc-ext" {
  name                 = var.dev_vi_ptc_ext_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_ptc_ext_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}
resource "azurerm_subnet" "subnet-dev-vi-ptc-sit" {
  name                 = var.dev_vi_ptc_sit_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_ptc_sit_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}

resource "azurerm_subnet" "subnet-dev-vi-trio-dev" {
  name                 = var.dev_vi_trio_dev_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_trio_dev_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}
resource "azurerm_subnet" "subnet-dev-vi-trio-sit" {
  name                 = var.dev_vi_trio_sit_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_trio_sit_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}

resource "azurerm_subnet" "subnet-dev-vi-xxx-0xx" {
  name                 = var.dev_vi_xxx_0xx_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_xxx_0xx_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}
resource "azurerm_subnet" "subnet-dev-vi-xxx-1xx" {
  name                 = var.dev_vi_xxx_1xx_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_xxx_1xx_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}
resource "azurerm_subnet" "subnet-dev-vi-xxx-2xx" {
  name                 = var.dev_vi_xxx_2xx_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_xxx_2xx_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}
resource "azurerm_subnet" "subnet-dev-vi-xxx-3xx" {
  name                 = var.dev_vi_xxx_3xx_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_xxx_3xx_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}
resource "azurerm_subnet" "subnet-dev-vi-xxx-4xx" {
  name                 = var.dev_vi_xxx_4xx_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_xxx_4xx_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}
resource "azurerm_subnet" "subnet-dev-vi-xxx-5xx" {
  name                 = var.dev_vi_xxx_5xx_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_xxx_5xx_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}
resource "azurerm_subnet" "subnet-dev-vi-xxx-6xx" {
  name                 = var.dev_vi_xxx_6xx_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vi_xxx_6xx_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]


  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }

}

resource "azurerm_subnet" "subnet-dev-pe-subnet" {
  name                                           = var.dev_pe_subnet_name
  resource_group_name                            = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name                           = var.vnt_nonprod
  address_prefixes                               = var.dev_pe_subnet_address_space
  enforce_private_link_endpoint_network_policies = true
  #enforce_private_link_service_network_policies  = false

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]
}

resource "azurerm_subnet" "subnet-dev-vm-subnet" {
  name                 = var.dev_vm_subnet_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_vm_subnet_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]
}

resource "azurerm_subnet" "subnet-dev-gw-subnet" {
  name                 = var.dev_gw_subnet_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.dev_gw_subnet_address_space

  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]
}


############################################################# UAT Subnet start ###################################################
/*
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
    azurerm_virtual_network.vnt-dev-nonprod
  ]
}
resource "azurerm_subnet" "subnet-uat-web" {
  name                 = var.uat_web_subnet_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.uat_web_subnet_address_space
  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
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
    azurerm_virtual_network.vnt-dev-nonprod
  ]
}
resource "azurerm_subnet" "subnet-uat-vm" {
  name                 = var.uat_vm_subnet_name
  resource_group_name  = azurerm_resource_group.rg-dev-nonprod.name
  virtual_network_name = var.vnt_nonprod
  address_prefixes     = var.uat_vm_subnet_address_space
  depends_on = [
    azurerm_virtual_network.vnt-dev-nonprod
  ]
}



#####################################################################################################################
resource "azurerm_virtual_network_peering" "azvntsoan0002_peer_azvnthubp001_peering" {
  name                      = "azvntsoan0002-peer-azvnthubp001"
  resource_group_name       = var.rgp_nonprod
  virtual_network_name      = var.vnt_nonprod
  remote_virtual_network_id = var.hub_virtual_network_id
}

# this subnet has delegations to Microsoft.web/servFarms
resource "azurerm_subnet" "subnet-dev-web" {
  name                 = "${var.dev_web_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg-dev1[0].name
  virtual_network_name = azurerm_virtual_network.vnt-dev-nonprod.name
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
  virtual_network_name = azurerm_virtual_network.vnt-dev-nonprod.name
  address_prefixes     = var.dev_pe_subnet_address_space
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "subnet-dev-gw" {
  name                 = "${var.dev_vm_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg-dev1[0].name
  virtual_network_name = azurerm_virtual_network.vnt-dev-nonprod.name
  address_prefixes     = var.dev_gw_subnet_address_space
}
resource "azurerm_subnet" "subnet-uat-db" {
  name                 = "${var.uat_db_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg-dev1[0].name
  virtual_network_name = azurerm_virtual_network.vnt-dev-nonprod.name
  address_prefixes     = var.uat_db_subnet_address_space
}

# this subnet has delegations to Microsoft.web/servFarms
resource "azurerm_subnet" "subnet-uat-web" {
  name                 = "${var.uat_web_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg-dev1[0].name
  virtual_network_name = azurerm_virtual_network.vnt-dev-nonprod.name
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
  virtual_network_name = azurerm_virtual_network.vnt-dev-nonprod.name
  address_prefixes     = var.uat_pe_subnet_address_space
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "subnet-uat-gw" {
  name                 = "${var.uat_gw_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg-dev1[0].name
  virtual_network_name = azurerm_virtual_network.vnt-dev-nonprod.name
  address_prefixes     = var.uat_gw_subnet_address_space
}
*/
/*




*/