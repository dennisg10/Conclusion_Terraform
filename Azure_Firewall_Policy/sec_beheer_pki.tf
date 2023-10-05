locals {
  sec_beheer_pki = [
    {
      name                  = "from_NLMAN08_to_FG-CA02P"
      protocols             = ["TCP"]
      source_addresses      = ["192.168.100.31"]
      destination_addresses = ["10.4.20.10"]
      destination_ports     = ["${local.services["dns"]}", "${local.services["kerberos"]}", "${local.services["ntp"]}", "${local.services["smb"]}", "${local.services["rpc"]}", "${local.services["ldap"]}", "${local.services["ldaps"]}", "${local.services["kerberos_authentication"]}", "${local.services["mgc"]}", "${local.services["mgcs"]}", "${local.services["wsm"]}", "49152-65535"]
    },
    {
      name                  = "HTTPs_from_NLMAN08_to_FG-CA03P"
      protocols             = ["TCP"]
      source_addresses      = ["192.168.100.31"]
      destination_addresses = ["10.4.20.11"]
      destination_ports     = ["${local.services["http"]}", "${local.services["https"]}"]
    }
  ]
}
