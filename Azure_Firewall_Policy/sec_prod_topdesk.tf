locals {
  sec_prod_topdesk = [
    {
      name                  = "SMB_from_Facilicom-Werkplek_to_fgg01ptopdesk.file.core.windows.net"
      protocols             = ["TCP"]
      source_addresses      = ["${local.customer_cidr["onpremise1"]}", "${local.customer_cidr["onpremise2"]}", "${local.customer_cidr["onpremise3"]}", "${local.customer_cidr["onpremise4"]}", "${local.customer_cidr["onpremise5"]}", "${local.customer_cidr["onpremise6"]}", "${local.customer_cidr["vpn"]}"]
      destination_addresses = ["10.4.38.132"]
      destination_ports     = ["${local.services["smb"]}"]
    },
    {
      name                  = "SMB_from_From_Point-to-Site_to_fgg01ptopdesk.file.core.windows.net"
      protocols             = ["TCP"]
      source_addresses      = ["172.31.252.0/22", "10.5.252.0/22"]
      destination_addresses = ["10.4.38.132"]
      destination_ports     = ["${local.services["smb"]}"]
    }
  ]
}
