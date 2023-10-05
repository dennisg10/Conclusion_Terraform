resource "azurerm_firewall_policy_rule_collection_group" "beheer" {
  #name = "rg-dg-nw-services"
  name = "${data.azurerm_resource_group.nw-services.name}-policy-beheer"
  #location           = data.azurerm_resource_group.nw-services.location
  firewall_policy_id = data.azurerm_firewall_policy.afw_policy.id
  priority           = 100

  network_rule_collection {
    name     = "beheer_icmp"
    priority = 100
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_beheer_icmp
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
    name     = "beheer_dns"
    priority = 101
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_beheer_dns
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
    name     = "beheer_ntp"
    priority = 102
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_beheer_ntp
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
    name     = "beheer_adds"
    priority = 104
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_beheer_adds
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
    name     = "beheer-aad-ds"
    priority = 105
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_beheer_aad-ds
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
    name     = "beheer-rdp"
    priority = 106
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_beheer_rdp
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
    name     = "beheer-arc"
    priority = 107
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_beheer_arc
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
    name     = "beheer-aadap"
    priority = 108
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_beheer_aadap
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
    name     = "beheer-pki"
    priority = 109
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_beheer_pki
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
    name     = "beheer-mgmtservers"
    priority = 110
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_beheer_mgmt_servers
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
    name     = "beheer-ncentral"
    priority = 111
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_beheer_ncentral
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
    name     = "beheer-zabbix"
    priority = 112
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_beheer_zabbix
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
    name     = "beheer-sap"
    priority = 113
    action   = "Allow"

    dynamic "rule" {
      for_each = local.sec_beheer_sap
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

