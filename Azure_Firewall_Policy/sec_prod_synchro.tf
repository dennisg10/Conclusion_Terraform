locals {
  sec_prod_synchro = [
    {
      name                  = "SQL_from_FG-SFAPP01P_to-FG-SQL01P"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.43.10"]
      destination_addresses = ["10.4.43.8"]
      destination_ports     = ["${local.services["mysql"]}"]
    }

  ]
}
