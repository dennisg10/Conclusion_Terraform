provider "azurerm" {
  features {}
}

terraform {
  required_providers {
  }
}

terraform {
  backend "azurerm" {
    storage_account_name = "sadgterraformf9b38b"
    container_name       = "networkmodules"
    key                  = "network-modules-test.terraform.tfstate"
    resource_group_name  = "rg-dgterraform"
    use_azuread_auth     = false
    subscription_id      = "c4c00ad0-34a0-4443-9487-8f258cfdcc24"

  }
}


module "networking_test" {
  source = "../module"

  rg_prefix            = "nw-dg-test"
  rg_prefix_short      = "test"
  location             = "West Europe"
  address_space_prefix = "172.17"
  vm_user_name         = "deploy_infra"
  #public_ssh_key_path  = "../../keys/id_rsa_deploy_infra.pub"
  #rg_nw_services       = "rg-nw-services"

  tags = {
    "CreatedBy" = "terraform",
    "Environment" = "test",
    "Project" = "DennisG",
    "Department" = "Cloud Infra"
  }

}
