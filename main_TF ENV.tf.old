terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.83.0"
    }
  }
}

provider "azurerm" {
  
  features {
    # Configuration options
  }
}

variable "location" {
  description = "TF-config varialble for location"
  default = "west europe"
}


resource "azurerm_resource_group" "RG-TF1" {
  location = var.location
  name = "azrgpsoan0001"

  tags = {
    "Environment" = "DEV"
    "CostCenter" = ""
    "Role"= "App"
    "Application"= "SOA"
  }

  
}

resource "azurerm_virtual_network" "VNT-TF1" {
  address_space = ["10.1.0.0/16"]
  name = "myrg-3-vnet"
  location = azurerm_resource_group.RG-TF1.location
  resource_group_name = azurerm_resource_group.RG-TF1.name
  
}

resource "azurerm_subnet" "SNT-TF1" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.RG-TF1.name
  virtual_network_name = azurerm_virtual_network.VNT-TF1.name
  address_prefixes       = ["10.1.0.0/24"]

  
}

resource "azurerm_storage_account" "STA-TF1" {
  account_replication_type = "LRS"
  account_tier = "Standard"
  location = azurerm_resource_group.RG-TF1.location
  name = "azstasoan0010"
  resource_group_name = azurerm_resource_group.RG-TF1.name
  allow_blob_public_access = true
  

}

resource "azurerm_storage_container" "name" {
    name = "tfstate"
    storage_account_name = azurerm_storage_account.STA-TF1.name
    container_access_type = "blob"  
}


/*

resource "azurerm_private_endpoint" "PEP-TF1" {
  name                = "azurerm_storage_account.STA-TF1.name-pe"
  location            = azurerm_resource_group.RG-TF1.location
  resource_group_name = azurerm_resource_group.RG-TF1.name
  subnet_id           = azurerm_subnet.example.id
  

  private_service_connection {
    name                           = "${random_string.random.result}-privateserviceconnection"
    private_connection_resource_id = azurerm_mariadb_server.example.id
    subresource_names              = [ "mariadbServer" ]
    is_manual_connection           = false?
  }
  
}
*/

/*

*/