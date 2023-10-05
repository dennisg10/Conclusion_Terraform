rg_prefix           = "beheer-devopspool1"
rg_prefix_short     = "devopspool1"
location            = "West Europe"
vm_user_name        = "deploy_infra"
public_ssh_key_path = "../../keys/id_rsa_deploy_infra.pub"
tags = {
  "CreatedBy"   = "terraform",
  "Environment" = "beheer",
  "Project"     = "Azure DevOps Agent Pool"
}

