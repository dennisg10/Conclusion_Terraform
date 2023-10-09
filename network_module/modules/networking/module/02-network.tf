# Create vnet and subnets for environment
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.rg_prefix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["${var.address_space_prefix}.0.0/16"]

  tags = var.tags
}

# Link private DNS to vnet
#resource "azurerm_private_dns_zone_virtual_network_link" "dns" {
#  name                  = "${var.rg_prefix}-vnet-link"
#  resource_group_name   = var.rg_nw_services
#  private_dns_zone_name = "intra.dennisg.io"
#  virtual_network_id    = azurerm_virtual_network.vnet.id
#  registration_enabled  = true
#}

# Create subnet for AKS cluster1
#resource "azurerm_subnet" "akscl1" {
#  name                                           = "sn-${var.rg_prefix_short}-aks-cl1"
#  resource_group_name                            = azurerm_resource_group.rg.name
#  virtual_network_name                           = azurerm_virtual_network.vnet.name
#  enforce_private_link_endpoint_network_policies = true
#  address_prefixes                               = ["${var.address_space_prefix}.1.0/26"]
#
#}

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