locals {
  sec_test_readsoft = [
    {
      name                  = "from_facilicom-werkplek_to_FG-RSAPP01T"
      protocols             = ["TCP"]
      source_addresses      = ["${local.customer_cidr["onpremise1"]}", "${local.customer_cidr["onpremise2"]}", "${local.customer_cidr["onpremise3"]}", "${local.customer_cidr["onpremise4"]}", "${local.customer_cidr["onpremise5"]}", "${local.customer_cidr["onpremise6"]}", "${local.customer_cidr["vpn"]}"]
      destination_addresses = ["10.4.75.5"]
      destination_ports     = ["${local.services["smb"]}", "${local.services["mysql"]}", "1090", "2700"]
    },
    {
      name                  = "SQL_from_facilicom-werkplek_to_FG-SQL01T"
      protocols             = ["TCP"]
      source_addresses      = ["${local.customer_cidr["onpremise1"]}", "${local.customer_cidr["onpremise2"]}", "${local.customer_cidr["onpremise3"]}", "${local.customer_cidr["onpremise4"]}", "${local.customer_cidr["onpremise5"]}", "${local.customer_cidr["onpremise6"]}", "${local.customer_cidr["vpn"]}"]
      destination_addresses = ["10.4.75.6"]
      destination_ports     = ["${local.services["mysql"]}"]
    },
    {
      name                  = "SQL_from_FG-RSAPP01T_to_FG-SQL01T"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.75.5", "10.4.75.10"]
      destination_addresses = ["10.4.75.6"]
      destination_ports     = ["${local.services["mysql"]}"]
    },
    {
      name                  = "SMB_from_FG-RSAPP01T_to_DFS.nl.fsg.local"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.75.5", "10.4.75.10"]
      destination_addresses = ["192.168.100.193", "192.168.100.194"]
      destination_ports     = ["${local.services["smb"]}"]
    },
    {
      name                  = "HTTPS_from_FG-RSAPP01T_to_webmail.facilicom.com"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.75.5", "10.4.75.10"]
      destination_addresses = ["92.70.103.79", "172.18.2.132"]
      destination_ports     = ["${local.services["https"]}"]
    },
    {
      name                  = "SMB_from_SAP_to_FG-RSAPP01T"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["10.1.49.0/24"]
      destination_addresses = ["10.4.75.5", "10.4.75.10"]
      destination_ports     = ["${local.services["netbios"]}", "${local.services["smb"]}"]
    },
    {
      name                  = "From_FG-RSAPP01T_to_SAP-RS-Director-A"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.75.5", "10.4.75.10"]
      destination_addresses = ["10.1.49.122", "10.1.49.194"]
      destination_ports     = ["${local.services["readsoft"]}", "${local.services["sap_ports2"]}"]
    },
    {
      name                  = "From_FG-RSAPP01T_to_SAP-RS-Director-D"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.75.5", "10.4.75.10"]
      destination_addresses = ["10.1.49.120"]
      destination_ports     = ["${local.services["readsoft"]}", "${local.services["sap_ports2"]}"]
    }
  ]
}
