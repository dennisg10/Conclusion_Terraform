## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | < 3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | < 3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine_scale_set.devopspool1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set) | resource |
| [azurerm_network_security_group.devopspool1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.buildimages](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_subnet_network_security_group_association.devopspool1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_image.buildagent](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/image) | data source |
| [azurerm_subnet.devopspool1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_virtual_network.nw_beheer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Location | `any` | n/a | yes |
| <a name="input_public_ssh_key_path"></a> [public\_ssh\_key\_path](#input\_public\_ssh\_key\_path) | Public key path for SSH. | `any` | n/a | yes |
| <a name="input_rg_prefix"></a> [rg\_prefix](#input\_rg\_prefix) | Resource Name | `any` | n/a | yes |
| <a name="input_rg_prefix_short"></a> [rg\_prefix\_short](#input\_rg\_prefix\_short) | Resource Name Short | `any` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | n/a | `list` | <pre>[<br>  {<br>    "access": "Allow",<br>    "destination_address_prefix": "172.20.1.64/26",<br>    "destination_port_ranges": [<br>      "22"<br>    ],<br>    "direction": "Inbound",<br>    "name": "AllowSSHfromAutomation",<br>    "priority": 100,<br>    "protocol": "*",<br>    "source_address_prefixes": [<br>      "172.20.0.0/26"<br>    ],<br>    "source_port_range": "*"<br>  }<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | n/a | yes |
| <a name="input_virtualmachines"></a> [virtualmachines](#input\_virtualmachines) | n/a | <pre>list(object({<br>    hostname        = string<br>    size            = string<br>    offer           = string<br>    publisher       = string<br>    sku             = string<br>    version         = string<br>    osdisk_size     = number<br>    create_datadisk = bool<br>    datadisk_size   = number<br>    zone            = number<br>  }))</pre> | <pre>[<br>  {<br>    "create_datadisk": false,<br>    "datadisk_size": 0,<br>    "hostname": "vm-azdo-0001",<br>    "offer": "RHEL",<br>    "osdisk_size": 64,<br>    "publisher": "RedHat",<br>    "size": "Standard_DS2_v2",<br>    "sku": "8-LVM",<br>    "version": "latest",<br>    "zone": 1<br>  }<br>]</pre> | no |
| <a name="input_vm_user_name"></a> [vm\_user\_name](#input\_vm\_user\_name) | User name for the VM | `any` | n/a | yes |

## Outputs

No outputs.
