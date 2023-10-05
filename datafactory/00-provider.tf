provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "< 3"
    }
    sops = {
      source  = "carlpett/sops"
      version = "~> 0.5"
    }
  }
}

