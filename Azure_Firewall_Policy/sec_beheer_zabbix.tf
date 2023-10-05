locals {
  sec_beheer_zabbix = [
    {
      name                  = "From_all_to_FG-ZBX01P"
      protocols             = ["TCP"]
      source_addresses      = ["${local.beheer_cidr}", "10.250.0.0/16", "10.251.0.0/16", "10.253.0.0/24", "10.253.2.0/24", "10.253.6.0/24", "192.168.100.0/23", "192.168.102.0/24", "192.168.200.0/24", "192.168.222.128/26", "192.168.224.0/24", "192.168.254.0/24"]
      destination_addresses = ["10.4.27.8"]
      destination_ports     = ["${local.services["zabbix_proxy2"]}"]
    },
    {
      name                  = "From_FG-ZBX01P_to_all"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.27.8"]
      destination_addresses = ["${local.beheer_cidr}", "10.250.0.0/16", "10.251.0.0/16", "10.253.0.0/24", "10.253.2.0/24", "10.253.6.0/24", "192.168.100.0/23", "192.168.102.0/24", "192.168.200.0/24", "192.168.222.128/26", "192.168.224.0/24", "192.168.254.0/24"]
      destination_ports     = ["${local.services["zabbix_proxy1"]}"]
    },
    {
      name                  = "ICMP_from_FG-ZBX01P_to_all"
      protocols             = ["ICMP"]
      source_addresses      = ["10.4.27.8"]
      destination_addresses = ["${local.beheer_cidr}", "10.250.0.0/16", "10.251.0.0/16", "10.253.0.0/24", "10.253.2.0/24", "10.253.6.0/24", "192.168.100.0/23", "192.168.102.0/24", "192.168.200.0/24", "192.168.222.128/26", "192.168.224.0/24", "192.168.254.0/24"]
      destination_ports     = ["${local.services["icmp"]}"]
    },
    {
      name                  = "from_FG-ZBX01P_to_zabbix.onecontrol.cloud"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.27.8"]
      destination_addresses = ["20.50.138.16"]
      destination_ports     = ["${local.services["zabbix_proxy2"]}"]
    },
    {
      name                  = "HTTP(S)_SSH_from_FG-ZBX01P"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.27.8"]
      destination_addresses = ["${local.beheer_cidr}", "10.253.0.0/24"]
      destination_ports     = ["${local.services["zabbix_proxy2"]}"]
    },
    {
      name                  = "SQL_from_FG-ZBX01P_SQLServers"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.27.8"]
      destination_addresses = ["10.250.0.0/16", "10.251.0.0/16", "10.253.0.0/24", "10.253.2.0/24", "10.253.6.0/24", "192.168.100.0/23", "192.168.102.0/24", "192.168.200.0/24", "192.168.222.128/26", "192.168.224.0/24", "192.168.254.0/24"]
      destination_ports     = ["${local.services["mysql"]}"]
    },
    {
      name                  = "SQL_from_FG-ZBX01P_to_NLSEVSQL01P"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.27.8"]
      destination_addresses = ["192.168.100.185"]
      destination_ports     = ["${local.services["zabbix_sqlport1"]}"]
    },
    {
      name                  = "SQL_from_FG-ZBX01P_to_BESQL02"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.27.8"]
      destination_addresses = ["192.168.200.66"]
      destination_ports     = ["${local.services["zabbix_sqlport2"]}"]
    }
  ]
}
