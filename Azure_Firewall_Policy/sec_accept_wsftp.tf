locals {
  sec_accept_wsftp = [
    {
      name                  = "SMB_from_FG-FTPAPP01A_to_FSAPPDATA.nl.fsg.local"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.90.5"]
      destination_addresses = ["192.168.100.193"]
      destination_ports     = ["${local.services["smb"]}"]
    },
    {
      name                  = "HTTPS_from_facilicom-werkplek_to_FG-FTPAPP01A"
      protocols             = ["TCP"]
      source_addresses      = ["${local.customer_cidr["onpremise1"]}", "${local.customer_cidr["onpremise2"]}", "${local.customer_cidr["onpremise3"]}", "${local.customer_cidr["onpremise4"]}", "${local.customer_cidr["onpremise5"]}", "${local.customer_cidr["onpremise6"]}", "${local.customer_cidr["vpn"]}"]
      destination_addresses = ["192.168.100.193"]
      destination_ports     = ["${local.services["http"]}", "${local.services["https"]}"]
    }
  ]
}
