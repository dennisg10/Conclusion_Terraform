# Create vnet and subnets for Networking Services
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.rg_prefix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["${var.address_space_prefix}.0.0/16"]

  tags = var.tags
}



# Create a AzureFirewallSubnet
resource "azurerm_subnet" "afwsubnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space_prefix}.0.0/26"]
}

# Create a AzureFirewallManagementSubnet
resource "azurerm_subnet" "afwmansubnet" {
  name                 = "AzureFirewallManagementSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space_prefix}.0.64/26"]
}

# Create BastionSubnet
resource "azurerm_subnet" "bastionsubnet" {
  name                 = "BastionSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space_prefix}.1.0/26"]
}

# Create GatewaySubnet
resource "azurerm_subnet" "gwsubnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space_prefix}.1.64/27"]
}

# Create a PrivateEndpointSubnet
resource "azurerm_subnet" "pesubnet" {
  name                 = "PrivateEndpointSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space_prefix}.2.0/24"]
}

# Create a FrontEndSubnet
resource "azurerm_subnet" "fesubnet" {
  name                 = "FrontEndSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space_prefix}.3.0/24"]
}
# Create a BackendSubnet
resource "azurerm_subnet" "besubnet" {
  name                 = "BackEndSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space_prefix}.4.0/24"]
}







