variable "rules" {
  default = [
    {
      name                       = "AllowSSHfromAutomation"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      source_address_prefixes    = ["172.20.0.0/26"]
      destination_port_ranges    = ["22"]
      destination_address_prefix = "172.20.1.64/26"
    }
  ]
}

