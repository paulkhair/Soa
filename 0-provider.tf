# Terraform Block
terraform {
  required_version = ">= 1.0.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.83.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
  backend "azurerm" {

    resource_group_name  = "azrgptfen0001"
    storage_account_name = "azstasoan0100"
    #resource_group_name  = "myrg-3"
    #storage_account_name = "azstasoan0101"
    container_name = "tfstate"
    key            = "terraform.tfstate"

  }


}

# Provider Block
provider "azurerm" {
  features {}
}

# Random String Resource
resource "random_string" "myrandom" {
  length  = 6
  upper   = false
  special = false
  number  = false
}