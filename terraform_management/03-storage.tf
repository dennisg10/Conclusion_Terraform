# Create random name

resource "random_string" "random" {
  length = 6
  special = false
  upper = false
}

# Create Storage Account for Terraform Productie
resource "azurerm_storage_account" "storageterraform" {
  name                     = "sa${lower(var.rg_prefix_short)}${random_string.random.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"

  tags = var.tags
}

# Create Container Terraform 
resource "azurerm_storage_container" "terraform_prod" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.storageterraform.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.storageterraform]
}

# Create Container Terraform for modules
resource "azurerm_storage_container" "tfstate_modules_networks" {
  name                  = "networkmodules"
  storage_account_name  = azurerm_storage_account.storageterraform.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.storageterraform]
}

# Create Container Terraform for nwservices
resource "azurerm_storage_container" "tfstate_nwservices" {
  name                  = "nwservices"
  storage_account_name  = azurerm_storage_account.storageterraform.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.storageterraform]
}

# Create Container Terraform for Firewall
resource "azurerm_storage_container" "tfstate_azfirewall" {
  name                  = "azfirewall"
  storage_account_name  = azurerm_storage_account.storageterraform.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.storageterraform]
}

# Create Container Terraform for Firewall Policy
resource "azurerm_storage_container" "tfstate_fwpolicy" {
  name                  = "fwpolicy"
  storage_account_name  = azurerm_storage_account.storageterraform.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.storageterraform]
}

# Create Container Terraform for AKS
resource "azurerm_storage_container" "tfstate_aks_cl_test" {
  name                  = "akscltest"
  storage_account_name  = azurerm_storage_account.storageterraform.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.storageterraform]
}