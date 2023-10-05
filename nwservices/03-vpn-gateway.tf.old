# Create a public IP for the VPN Gateway
resource "azurerm_public_ip" "vpngw" {
  name                = "${var.rg_prefix}-vpngw-pubip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags
}

# Create VPN Gateway
resource "azurerm_virtual_network_gateway" "vpngw" {
  name                = "${var.rg_prefix}-vpngw"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw2"
  generation    = "Generation2"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpngw.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gwsubnet.id
  }

  vpn_client_configuration {
    address_space = ["172.22.200.0/23"]
  }

tags = var.tags

}

