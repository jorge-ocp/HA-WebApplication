terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.73.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {

  }

  subscription_id = var.subscription_id
  client_id       = var.client_id
  tenant_id       = var.tenant_id
  client_secret   = var.client_secret

}

resource "azurerm_network_security_group" "tf-ns" {
  name                = "tf-ns"
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_virtual_network" "tf-network" {
  name                = "tf-network"
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.tf-ns.id
  }

  tags = {
    environment = var.environment
  }
}
