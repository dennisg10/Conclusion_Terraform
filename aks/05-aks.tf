resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.rg_prefix}-k8s"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  dns_prefix          = "${var.rg_prefix_short}-k8s"

  identity {
    type = "SystemAssigned"
  }


  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_DS2_v2"
    node_count = var.node_count
  }
  linux_profile {
    admin_username = var.username

    ssh_key {
      key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
    }
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

}
  