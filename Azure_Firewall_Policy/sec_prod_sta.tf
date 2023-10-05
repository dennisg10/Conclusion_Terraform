locals {
  sec_prod_sta = [
    {
      name                  = "SQL_from_FG-STAWEB01P_to_FG-SQL01P"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.42.6"]
      destination_addresses = ["10.4.43.8"]
      destination_ports     = ["${local.services["mysql"]}"]
    },
    {
      name                  = "SQL_from_FG-STAAPP01P_to_FG-SQL01P"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.43.7"]
      destination_addresses = ["10.4.43.8"]
      destination_ports     = ["${local.services["mysql"]}"]
    },
    {
      name                  = "HTTP(S)_from_FG-STAAPP01P_to_ASB-Prod"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.43.7"]
      destination_addresses = ["145.35.90.23/32"]
      destination_ports     = ["${local.services["http"]}", "${local.services["https"]}", "${local.services["sta_port1"]}", "${local.services["sta_port2"]}", "${local.services["sta_port3"]}", "${local.services["sta_port4"]}"]
    },
    {
      name                  = "SQL_from_ASB-Prod_to_FG-SQL01P"
      protocols             = ["TCP"]
      source_addresses      = ["145.35.90.23/32"]
      destination_addresses = ["10.4.43.8"]
      destination_ports     = ["${local.services["mysql"]}"]
    },
    {
      name                  = "HTTP(S)_from_Facilicom-Citrix_to_FG-STAAPP01P"
      protocols             = ["TCP"]
      source_addresses      = ["192.168.102.0/24"]
      destination_addresses = ["10.4.43.7"]
      destination_ports     = ["${local.services["http"]}", "${local.services["https"]}"]
    },
    {
      name                  = "SQL_from_Facilicom-Citrix_to_FG-SQL01P"
      protocols             = ["TCP"]
      source_addresses      = ["192.168.102.0/24"]
      destination_addresses = ["10.4.43.8"]
      destination_ports     = ["${local.services["mysql"]}"]
    }
  ]
}
