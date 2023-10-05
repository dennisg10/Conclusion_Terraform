locals {
  sec_test_icmp = [
    {
      name                  = "internal icmp Access for test"
      protocols             = ["ICMP"]
      source_addresses      = ["172.16.0.0/16"]
      destination_addresses = ["172.16.0.0/16"]
      destination_ports     = ["${local.services["icmp"]}"]
    }
  ]
}
