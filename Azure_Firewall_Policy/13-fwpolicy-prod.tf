resource "azurerm_firewall_policy_rule_collection_group" "prod" {
  name               = "${data.azurerm_resource_group.nw-services.name}-policy-prod"
  firewall_policy_id = data.azurerm_firewall_policy.afw_policy.id
  priority           = 400

  network_rule_collection {
    name     = "prod-wsftp"
    priority = 400
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_prod_wsftp
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
    name     = "prod-cypress"
    priority = 401
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_prod_cypress
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
    name     = "prod-sta"
    priority = 402
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_prod_sta
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
    name     = "prod-readsoft"
    priority = 403
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_prod_readsoft
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
    name     = "prod-topdesk"
    priority = 404
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_prod_topdesk
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
    name     = "prod-stabicad"
    priority = 405
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_prod_stabicad
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
    name     = "prod-synchro"
    priority = 406
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_prod_synchro
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
