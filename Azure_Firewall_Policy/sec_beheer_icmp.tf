locals {
  sec_beheer_icmp = [
    {
      name                  = "internal icmp Access"
      protocols             = ["ICMP"]
      source_addresses      = ["${local.beheer_cidr}"]
      destination_addresses = ["${local.beheer_cidr}"]
      destination_ports     = ["${local.services["icmp"]}"]
    }
  ]
}
