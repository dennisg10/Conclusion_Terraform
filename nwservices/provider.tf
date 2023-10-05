provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "~> 0.5"
    }
  }
}

provider "sops" {
}

terraform {
  backend "azurerm" {
    storage_account_name = "sadgterraform001sf"
    container_name       = "nwservices"
    key                  = "nw-services.terraform.tfstate"
    resource_group_name  = "rg-dgterraform"
    use_azuread_auth     = false
    subscription_id      = "2e1546b8-6f98-42fc-91df-3a94db0d80ab"

  }
}
