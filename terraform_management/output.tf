output storageaccount {
  value       = azurerm_storage_account.storageterraform.name
  description = "Name of the Storage Account"
}

output storagecontainer_storage {
  value       = azurerm_storage_container.terraform_prod.name
  description = "Name of the Storage Container for the storage account"
  depends_on  = [azurerm_storage_account.storageterraform]
}

output storagecontainer_modules {
  value       = azurerm_storage_container.tfstate_modules_networks.name
  description = "Name of the Storage Container for the Terraform Modules"
  depends_on  = [azurerm_storage_account.storageterraform]
}

output storagecontainer_nwservices {
  value       = azurerm_storage_container.tfstate_nwservices.name
  description = "Name of the Storage Container for the network services"
  depends_on  = [azurerm_storage_account.storageterraform]
}

output storagecontainer_firewall {
  value       = azurerm_storage_container.tfstate_azfirewall.name
  description = "Name of the Storage Container for the firewall"
  depends_on  = [azurerm_storage_account.storageterraform]
}

output storagecontainer_fwpolicy {
  value       = azurerm_storage_container.tfstate_fwpolicy.name
  description = "Name of the Storage Container for the firewall policy"
  depends_on  = [azurerm_storage_account.storageterraform]
}

output storagecontainer_aks {
  value       = azurerm_storage_container.tfstate_aks_cl_test.name
  description = "Name of the Storage Container for AKS"
  depends_on  = [azurerm_storage_account.storageterraform]
}