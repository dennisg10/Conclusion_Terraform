locals {
  sec_accept_cypress = [
    {
      name                  = "From_SAP-PI/PO_to_FGCYAPP01A"
      protocols             = ["TCP"]
      source_addresses      = ["10.1.49.0/24"]
      destination_addresses = ["10.4.91.5"]
      destination_ports     = ["${local.services["cypress_ports"]}"]
    },
    {
      name                  = "From_Facilicom-Werkplekken_to_FG-CYAPP01A"
      protocols             = ["TCP"]
      source_addresses      = ["${local.customer_cidr["onpremise1"]}", "${local.customer_cidr["onpremise2"]}", "${local.customer_cidr["onpremise3"]}", "${local.customer_cidr["onpremise4"]}", "${local.customer_cidr["onpremise5"]}", "${local.customer_cidr["onpremise6"]}", "${local.customer_cidr["vpn"]}"]
      destination_addresses = ["10.4.91.5"]
      destination_ports     = ["${local.services["cypress_ports"]}"]
    },
    {
      name                  = "From_FG-CYPAPP01A_to_Facilicom-Werkplekken-Printers"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.91.5"]
      destination_addresses = ["${local.customer_cidr["onpremise1"]}", "${local.customer_cidr["onpremise2"]}", "${local.customer_cidr["onpremise3"]}", "${local.customer_cidr["onpremise4"]}", "${local.customer_cidr["onpremise5"]}", "${local.customer_cidr["onpremise6"]}", "${local.customer_cidr["vpn"]}"]
      destination_ports     = ["${local.services["printing_port1"]}", "${local.services["printing_port2"]}"]
    },
    {
      name                  = "SMB_from_FG-CYYAPP01A_to_DFS"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.91.5"]
      destination_addresses = ["192.168.100.194"]
      destination_ports     = ["${local.services["smb"]}"]
    },
    {
      name                  = "LPR_from_S788C170_to_FG-CYPAPP01A"
      protocols             = ["TCP"]
      source_addresses      = ["10.220.10.19"]
      destination_addresses = ["10.4.91.5"]
      destination_ports     = ["${local.services["printing_port1"]}"]
    }
  ]
}
