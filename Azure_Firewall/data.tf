data "azurerm_subnet" "afw_subnet" {
  name                 = "AzureFirewallSubnet"
  virtual_network_name = "vnet-dg-nw-services"
  resource_group_name  = "rg-dg-nw-services"
}

output "subnet_afw_id" {
  value = data.azurerm_subnet.afw_subnet.name
}

data "azurerm_resource_group" "nw-services" {
  name = "rg-dg-nw-services"
}
