resource "azurerm_firewall_policy_rule_collection_group" "accept" {
  name               = "${data.azurerm_resource_group.nw-services.name}-policy-accept"
  firewall_policy_id = data.azurerm_firewall_policy.afw_policy.id
  priority           = 300

  network_rule_collection {
    name     = "accept-wsftp"
    priority = 300
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_accept_wsftp
      content {
        name                  = rule.value.name
        protocols             = rule.value.protocols
        source_addresses      = rule.value.source_addresses
        destination_addresses = rule.value.destination_addresses
        destination_ports     = rule.value.destination_ports
      }
    }
  }
  network_rule_collection {
    name     = "accept-cypress"
    priority = 301
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_accept_cypress
      content {
        name                  = rule.value.name
        protocols             = rule.value.protocols
        source_addresses      = rule.value.source_addresses
        destination_addresses = rule.value.destination_addresses
        destination_ports     = rule.value.destination_ports
      }
    }
  }
  network_rule_collection {
    name     = "accept-sta"
    priority = 302
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_accept_sta
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
