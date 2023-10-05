data "azurerm_client_config" "current" {
}

data "azurerm_virtual_network" "nw_beheer" {
  name                = "vnet-nw-beheer"
  resource_group_name = "rg-nw-beheer"
}

data "azurerm_subnet" "devopspool1" {
  name                 = "sn-beheer-devopspool1"
  virtual_network_name = "vnet-nw-beheer"
  resource_group_name  = "rg-nw-beheer"
}

data "azurerm_image" "buildagent" {
  name                = "ubuntu2004-24315-updated"
  resource_group_name = azurerm_resource_group.rg.name
}

