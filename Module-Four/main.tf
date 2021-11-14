terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.46.0"
    }
  }
}


provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "IT356_TF_Test_RG" {
  name     = "IT356_TF_Test_RG"
  location = "eastus2"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "IT356_TF_Test_VNET"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus2"
  resource_group_name = "IT356_TF_Test_RG"
}

resource "azurerm_subnet" "subnet" {
  name                 = "IT365-SN-Windows"
  resource_group_name  = "IT356_TF_Test_RG"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
