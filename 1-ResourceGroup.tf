resource "azurerm_resource_group" "rg-dev-nonprod" {
  location = var.location
  name     = var.rgp_nonprod

  tags = merge(local.Common_tags, local.nonprod_tags)
  #tags = local.Common_tags    
}

/*


resource "azurerm_resource_group" "rg-dev-fit" {
  location = var.location
  name     = var.rgp_fit
  count = "1"

  tags     = "${merge (local.Common_tags, local.soa_tags)}"
  #tags = local.Common_tags 
     
}

resource "azurerm_resource_group" "rg-dev-trio" {
  location = var.location
  name     = var.rgp_trio
  count = "1"

  tags     = "${merge (local.Common_tags, local.soa_tags)}"
  #tags = local.Common_tags 
     
}
resource "azurerm_resource_group" "rg-dev-ptc" {
  location = var.location
  name     = var.rgp_ptc
  count = "1"

  tags     = "${merge (local.Common_tags, local.soa_tags)}"
  #tags = local.Common_tags 
     
}
resource "azurerm_resource_group" "rg-dev-db" {
  location = var.location
  name     = var.rgp_db
  count = "1"

  tags     = "${merge (local.Common_tags, local.soa_tags)}"
  #tags = local.Common_tags 
     
}
resource "azurerm_resource_group" "rg-dev-storage" {
  location = var.location
  name     = var.rgp_storage
  count = "1"

  tags     = "${merge (local.Common_tags, local.soa_tags)}"
  #tags = local.Common_tags 
     
}


/*
resource "azurerm_resource_group" "rg-dev2" {
  location = var.location)
  name     = "${var.platform} ${var.object[1]} ${var.application} ${var.environment} ${count.index}"
  count    = 1
  tags     = local.Common_tags
}
*/
