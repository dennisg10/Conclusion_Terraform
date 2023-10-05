# Create a Azure Datafactory
resource "azurerm_data_factory" "datafactory" {
  name                            = "poc-${var.rg_prefix}-0001"
  location                        = azurerm_resource_group.rg.location
  resource_group_name             = azurerm_resource_group.rg.name
  public_network_enabled          = false
  managed_virtual_network_enabled = true
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags
}

# Create a Azure Runtime with Management Network Enabled
resource "azurerm_data_factory_integration_runtime_azure" "azureirt" {
  name                    = "Runtime01"
  data_factory_id         = azurerm_data_factory.datafactory.id
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  virtual_network_enabled = true

}

# Create a Azure Runtime Public
resource "azurerm_data_factory_integration_runtime_azure" "azurepub" {
  name                = "Runtime02-pub"
  data_factory_id     = azurerm_data_factory.datafactory.id
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  # compute_type values (General, MemoryOptimized and ComputeOptimized)
  compute_type = "MemoryOptimized"

  # corecount values (8,16,32,48,80,144,272)  
  core_count = 16
}

#Create StorageAccount:
resource "azurerm_storage_account" "df_sa" {
  name                     = "dfsapoc012012"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_kind             = "BlobStorage"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags                     = var.tags
}


resource "azurerm_data_factory_managed_private_endpoint" "managed_blob" {
  name               = "Managed_Blob_EP"
  data_factory_id    = azurerm_data_factory.datafactory.id
  target_resource_id = azurerm_storage_account.df_sa.id
  subresource_name   = "blob"
  
}

#resource "null_resource" "endpoint_approval" {
#  depends_on = [azurerm_data_factory_managed_private_endpoint.managed_blob]
#  provisioner "local-exec" {
#    command     = <<-EOT
#           storage_pe_id=$(az network private-endpoint-connection list --id ${azurerm_storage_account.df_sa.id} --query "[?contains(properties.privateEndpoint.id, 'vnet')].id" -o tsv)
#           az network private-endpoint-connection approve --id $storage_pe_id --description "Approved in Terraform"
#        EOT
#interpreter = ["pwsh", "-Command"]
#  }
# tags = var.tags
#}

