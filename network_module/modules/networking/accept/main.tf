provider "azurerm" {
  features {}
}

terraform {
  required_providers {
  }
}

terraform {
  backend "azurerm" {
    storage_account_name = "sadgterraform001sf"
    container_name       = "networkmodules"
    key                  = "network-modules-accept.terraform.tfstate"
    resource_group_name  = "rg-dgterraform"
    use_azuread_auth     = false
    subscription_id      = "274ed5a4-bc5f-4f7a-9b29-6bf02b73f2c8"

  }
}

module "networking_accept" {
  source = "../module"

  rg_prefix            = "nw-dg-accept"
  rg_prefix_short      = "accept"
  location             = "West Europe"
  address_space_prefix = "172.18"
  vm_user_name         = "deploy_infra"
  #public_ssh_key_path  = "../../keys/id_rsa_deploy_infra.pub"
  #rg_nw_services       = "rg-nw-services"

  tags = {
    "CreatedBy" = "terraform",
    "Environment" = "accept",
    "Project" = "DennisG",
    "Department" = "Cloud Infra"
  }

}
