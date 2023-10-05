resource "azurerm_firewall_policy_rule_collection_group" "test" {
  name = "${data.azurerm_resource_group.nw-services.name}-policy-test"
  #location           = data.azurerm_resource_group.nw-services.location
  firewall_policy_id = data.azurerm_firewall_policy.afw_policy.id
  priority           = 200

  network_rule_collection {
    name     = "test-readsoft"
    priority = 200
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_test_readsoft
      content {
        name                  = rule.value.name
        protocols             = rule.value.protocols
        source_addresses      = rule.value.source_addresses
        destination_addresses = rule.value.destination_addresses
        destination_ports     = rule.value.destination_ports
      }
    }
  }


  depends_on = [
    data.azurerm_firewall_policy.afw_policy
  ]
}
