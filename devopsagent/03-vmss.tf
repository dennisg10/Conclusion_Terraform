resource "azurerm_linux_virtual_machine_scale_set" "devopspool1" {
  name                = "${var.rg_prefix_short}-vmss"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard_D2_v3"
  instances           = 0
  admin_username      = var.vm_user_name
  zone_balance        = true
  zones               = [1, 2, 3]

  admin_ssh_key {
    username   = var.vm_user_name
    public_key = file(var.public_ssh_key_path)
  }

  source_image_id = data.azurerm_image.buildagent.id

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "${var.rg_prefix_short}-nic"
    primary = true

    ip_configuration {
      name      = "ipconfig0"
      primary   = true
      subnet_id = data.azurerm_subnet.devopspool1.id
    }
  }

  lifecycle {
    ignore_changes = [
      automatic_os_upgrade_policy,
      boot_diagnostics,
      instances,
      overprovision,
      single_placement_group,
      admin_ssh_key,
      tags
    ]
  }

  tags = var.tags

}
