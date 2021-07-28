terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }

  backend "azurerm" {
    storage_account_name = "kinstorageremotetf"
    container_name       = "tfbackends"
    key                  = "terraform.tfstate"
    use_msi              = true
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}