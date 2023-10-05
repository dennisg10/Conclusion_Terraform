data "azurerm_subscription" "primary" {
}

data "azurerm_management_group" "primary" {
    display_name = "Azure Connectivity Group"
}


data "azurerm_client_config" "example" {
}

data "azurerm_management_group" "example" {
  display_name = "Azure Connectivity Group"
}

resource "azurerm_role_definition" "example" {
  role_definition_id = "8e3af657-a8ff-443c-a75c-2fe8c4bcb635"
  name               = "Owner"
  scope              = data.azurerm_subscription.primary.id

  permissions {
    actions     = ["Microsoft.Resources/subscriptions/resourceGroups/read"]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id,
  ]
}

resource "azurerm_role_assignment" "example" {
  name               = "7c57faa0-cb7f-402d-a1b5-ef6592800d4a"
  scope              = data.azurerm_management_group.primary.id
  role_definition_id = azurerm_role_definition.example.role_definition_resource_id
  principal_id       = data.azurerm_client_config.example.object_id
}