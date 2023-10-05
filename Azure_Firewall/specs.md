## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.71.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.71.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_firewall.AF_FP](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/firewall) | resource |
| [azurerm_firewall_policy.policy](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/firewall_policy) | resource |
| [azurerm_public_ip.AF_FP](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.nw-services](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.afw_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space_prefix"></a> [address\_space\_prefix](#input\_address\_space\_prefix) | VNET address prefix | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Resources Location | `any` | n/a | yes |
| <a name="input_rg_prefix"></a> [rg\_prefix](#input\_rg\_prefix) | Resource Prefix Name | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for resourcegroups | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_afw_id"></a> [subnet\_afw\_id](#output\_subnet\_afw\_id) | n/a |
