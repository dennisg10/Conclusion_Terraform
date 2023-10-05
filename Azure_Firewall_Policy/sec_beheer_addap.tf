locals {
  sec_beheer_aadap = [
    {
      name                  = "HTTP(S)_from_ApplicationProxies_to_nlsev01p"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.3.134", "10.4.3.135"]
      destination_addresses = ["192.168.100.185"]
      destination_ports     = ["${local.services["http"]}", "${local.services["https"]}"]
    }
  ]
}
