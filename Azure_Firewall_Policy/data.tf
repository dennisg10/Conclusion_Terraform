data "azurerm_firewall_policy" "afw_policy" {
  name                = "dg-nw-services-af-AF_FP-policy"
  resource_group_name = "rg-dg-nw-services"
}

data "azurerm_resource_group" "nw-services" {
  name = "rg-dg-nw-services"
}
