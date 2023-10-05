terraform {
  required_version = ">=1.0"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "sadgterraform001sf"
    container_name       = "akscltest"
    key                  = "akscltestgit.terraform.tfstate"
    resource_group_name  = "rg-dgterraform"
    use_azuread_auth     = false
    subscription_id      = "2e1546b8-6f98-42fc-91df-3a94db0d80ab"

  }
}