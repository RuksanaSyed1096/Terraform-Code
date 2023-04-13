terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=3.0.0"
    }
  }
}

provider "azurerm" {
 features {}
  
}

resource "random_string" "random" {
    length  = 6
    special = false
    upper   = false
}

# storage
resource "azurerm_storage_account" "storage" {
    name = "${lower(var.storagename)}${random_string.random.result}"
    resource_group_name = var.resource_group_name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "GRS"
  
}