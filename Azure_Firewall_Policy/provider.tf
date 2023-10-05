terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}


terraform {
  backend "azurerm" {
    storage_account_name = "sadgterraform001sf"
    container_name       = "fwpolicy"
    key                  = "fwpolicy.terraform.tfstate"
    resource_group_name  = "rg-dgterraform"
    use_azuread_auth     = false
    subscription_id      = "2e1546b8-6f98-42fc-91df-3a94db0d80ab"

  }
}
