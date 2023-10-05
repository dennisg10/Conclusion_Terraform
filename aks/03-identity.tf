# User Assigned Identities 
resource "azurerm_user_assigned_identity" "ua_id" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = "identity-${var.rg_prefix}-k8s"

  tags = var.tags
}

resource "azurerm_user_assigned_identity" "mi_aks" {

  for_each = { for mi in var.mui_id : mi.name => mi
    if mi.name != null
  }

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  name = "identity-${var.rg_prefix}-${each.value.name}"
  tags = each.value.tags

}
