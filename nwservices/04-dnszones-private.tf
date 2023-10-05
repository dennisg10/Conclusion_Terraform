# Create private DNS zone for intra.dhlparcel.io
resource "azurerm_private_dns_zone" "intra" {
  name                = "intra.glasbergen.io"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

# Create private DNS zone for aks
resource "azurerm_private_dns_zone" "aks" {
  name                = "privatelink.westeurope.azmk8s.io"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

# Create private DNS Zone for Azure Container Registry
resource "azurerm_private_dns_zone" "acr" {
  name                = "privatelink.azurecr.io"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

# Create private DNS Zone for Postgres Databases
resource "azurerm_private_dns_zone" "postgres" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

# Create private DNS Zone for DADP Datafactory
resource "azurerm_private_dns_zone" "datafactory" {
  name                = "privatelink.westeurope.datafactory.azure.net"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

# Create private DNS Zone for Blob Storage
resource "azurerm_private_dns_zone" "blobstorage" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

# Create private DNS Zone for File Storage
resource "azurerm_private_dns_zone" "filestorage" {
  name                = "privatelink.file.core.windows.net"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

# Create private DNS Zone for Data Lake
resource "azurerm_private_dns_zone" "datalake" {
  name                = "privatelink.dfs.core.windows.net"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

# Create private DNS Zone for Azure Monitor
resource "azurerm_private_dns_zone" "privatelink-monitor-azure-com" {
  name                = "privatelink.monitor.azure.com"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

# Create private DNS Zone for OMS Insights
resource "azurerm_private_dns_zone" "privatelink-oms-opinsights-azure-com" {
  name                = "privatelink.oms.opinsights.azure.com"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

# Create private DNS Zone for ODS Insights
resource "azurerm_private_dns_zone" "privatelink-ods-opinsights-azure-com" {
  name                = "privatelink.ods.opinsights.azure.com"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

# Create private DNS Zone for Agent Automation
resource "azurerm_private_dns_zone" "privatelink-agentsvc-azure-automation-net" {
  name                = "privatelink.agentsvc.azure-automation.net"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

# Create private DNS Zone for SQL Server
resource "azurerm_private_dns_zone" "sqlserver" {
  name                = "privatelink.database.windows.net"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

# Create private DNS Zone for Web Apps
resource "azurerm_private_dns_zone" "webapps" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

# Create private DNS Zone for keyvaults
resource "azurerm_private_dns_zone" "keyvault" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

