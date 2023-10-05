locals {
  sec_beheer_arc = [
    {
      name                  = "HTTPS_From_on-prem_to_ARC"
      protocols             = ["TCP"]
      source_addresses      = ["192.168.100.0/23", "10.253.0.0/24", "192.168.200.0/24", "192.168.254.0/24", "192.168.222.0/24"]
      destination_addresses = ["10.4.26.132", "10.4.26.133", "10.4.26.134", "10.4.26.135", "10.4.26.136"]
      destination_ports     = ["${local.services["https"]}"]
    }
  ]
}
