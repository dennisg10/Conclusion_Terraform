locals {
  sec_beheer_dns = [
    {
      name                  = "Between_DNS_Servers"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["10.4.20.5", "10.4.20.6", "10.4.20.7", "10.4.20.8", "10.4.17.68", "10.4.17.69"]
      destination_addresses = ["10.4.20.5", "10.4.20.6", "10.4.20.7", "10.4.20.8", "10.4.17.68", "10.4.17.69"]
      destination_ports     = ["${local.services["dns"]}"]
    },
    {
      name                  = "From_DNS_Clients"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["10.4.0.0/16", "172.31.252.0/22", "10.5.252.0/22"]
      destination_addresses = ["10.4.20.5", "10.4.20.6", "10.4.20.7", "10.4.20.8", "10.4.17.68", "10.4.17.69"]
      destination_ports     = ["${local.services["dns"]}"]
    },
  ]
}
