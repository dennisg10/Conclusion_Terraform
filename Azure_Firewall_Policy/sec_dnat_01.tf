locals {
  sec_dnat_01 = [
    {
      name                  = "SSH_to_FG-FTPAPP01P"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_addresses = ["20.8.65.128"]
      destination_ports     = ["22"]
      translated_port       = "22"
      translated_address    = "10.4.42.5"
    },
    {
      name                  = "SSH_to_FG-FTPAPP01A"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_addresses = ["20.8.65.129"]
      destination_ports     = ["22"]
      translated_port       = "22"
      translated_address    = "10.4.90.5"
    }
  ]
}
