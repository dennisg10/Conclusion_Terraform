provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "< 3"
    }
  }
}


terraform {
  backend "azurerm" {
    storage_account_name = "saterraform001sf"
    container_name       = "beheer"
    key                  = "azuredevopspool.terraform.tfstate"
    resource_group_name = "rg-beheer-terraform"
    use_azuread_auth     = true
    subscription_id      = ""

  }
}




