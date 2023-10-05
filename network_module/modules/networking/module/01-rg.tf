#Create a Resourcegroup
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.rg_prefix}"
  location = var.location

  tags = var.tags
}
