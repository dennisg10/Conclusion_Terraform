provider "azurerm" {
  features {}
#  use_msi         = true
#  subscription_id = "c4c00ad0-34a0-4443-9487-8f258cfdcc24"
#  tenant_id       = "7c57faa0-cb7f-402d-a1b5-ef6592800d4a"
#  client_id       = "da67aad4-5940-4146-b1b9-3a88b5181e08"
}

#provider "azuread" {
#  use_msi   = true
#  tenant_id = "7c57faa0-cb7f-402d-a1b5-ef6592800d4a"
#}

terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "random" {
  # Configuration options
}

terraform {
  backend "azurerm" {
    storage_account_name = "sadgterraformf9b38b"
    container_name       = "tfstate"
    key                  = "backend.terraform.tfstate"
    resource_group_name  = "rg-dgterraform"
    use_azuread_auth     = false
    subscription_id      = "c4c00ad0-34a0-4443-9487-8f258cfdcc24"

  }
}



