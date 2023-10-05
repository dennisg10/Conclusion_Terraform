resource "azurerm_public_ip" "AF_FP" {
  name                = "${var.rg_prefix}-AF_FP-PIP-01"
  location            = data.azurerm_resource_group.nw-services.location
  resource_group_name = data.azurerm_resource_group.nw-services.name
  allocation_method   = "Static"
  sku                 = "Standard"

  zones = [1, 2, 3]

  tags = var.tags
}

resource "azurerm_firewall" "AF_FP" {
  name                = "${var.rg_prefix}-AF_FP"
  location            = data.azurerm_resource_group.nw-services.location
  resource_group_name = data.azurerm_resource_group.nw-services.name

  sku_name          = "AZFW_VNet"
  sku_tier          = "Standard"
  threat_intel_mode = "Deny"

  private_ip_ranges = ["IANAPrivateRanges"]

  ip_configuration {
    name                 = "AF_FPipconfig"
    subnet_id            = data.azurerm_subnet.afw_subnet.id
    public_ip_address_id = azurerm_public_ip.AF_FP.id
  }

  firewall_policy_id = azurerm_firewall_policy.policy.id

  tags = var.tags
}

resource "azurerm_firewall_policy" "policy" {
  name                = "${var.rg_prefix}-AF_FP-policy"
  resource_group_name = data.azurerm_resource_group.nw-services.name
  location            = data.azurerm_resource_group.nw-services.location

  sku               = "Standard"
  private_ip_ranges = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16", "100.64.0.0/10"]
  dns {
    proxy_enabled = true
  }

  tags = var.tags
}
