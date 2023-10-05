locals {
  sec_accept_sta = [
    {
      name                  = "SQL_from_FG-STAWEB01A_to_FG-SQL01A"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.90.6"]
      destination_addresses = ["10.4.91.7"]
      destination_ports     = ["${local.services["mysql"]}"]
    },
    {
      name                  = "SQL_from_FG-STAAPP01A_to_FG-SQL01A"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.91.6"]
      destination_addresses = ["10.4.91.7"]
      destination_ports     = ["${local.services["mysql"]}"]
    },
    {
      name                  = "HTTP(S)_from_FG-STAAPP01A_to_ASB-ACC"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.91.6"]
      destination_addresses = ["145.35.90.80/32"]
      destination_ports     = ["${local.services["http"]}", "${local.services["https"]}", "${local.services["sta_port1"]}", "${local.services["sta_port2"]}", "${local.services["sta_port3"]}", "${local.services["sta_port4"]}"]
    },
    {
      name                  = "SQL_from_ASB-ACC_to_FG-SQL01A"
      protocols             = ["TCP"]
      source_addresses      = ["145.35.90.80/32"]
      destination_addresses = ["10.4.91.7"]
      destination_ports     = ["${local.services["mysql"]}"]
    },
    {
      name                  = "HTTP(s)_from_Facilicom-Citrix_to_FG-STAAPP01A"
      protocols             = ["TCP"]
      source_addresses      = ["192.168.102.0/24"]
      destination_addresses = ["10.4.91.6"]
      destination_ports     = ["${local.services["http"]}", "${local.services["https"]}"]
    },
    {
      name                  = "SQL_from_Facilicom-Citrix_to_FG-SQL01A"
      protocols             = ["TCP"]
      source_addresses      = ["192.168.102.0/24"]
      destination_addresses = ["10.4.91.7"]
      destination_ports     = ["${local.services["mysql"]}"]
    },
  ]
}
