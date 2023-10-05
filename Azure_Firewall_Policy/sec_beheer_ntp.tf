locals {
  sec_beheer_ntp = [
    {
      name                  = "Allow NTP to Domain Controllers"
      protocols             = ["UDP"]
      source_addresses      = ["10.4.0.0/16", "172.31.252.0/22", "10.5.252.0/22"]
      destination_addresses = ["10.4.20.5", "10.4.20.6", "10.4.20.7", "10.4.20.8"]
      destination_ports     = ["${local.services["ntp"]}"]
    },
    {
      name                  = "Allow NTP to time.windows.com"
      protocols             = ["UDP"]
      source_addresses      = ["${local.beheer_cidr}"]
      destination_addresses = ["20.101.57.9"]
      destination_ports     = ["${local.services["ntp"]}"]
    }
  ]
}
