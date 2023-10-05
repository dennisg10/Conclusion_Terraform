resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.rg_prefix}-k8s-resources"
  location = var.location

  tags = var.tags
}



