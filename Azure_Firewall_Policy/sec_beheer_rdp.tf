locals {
  sec_beheer_rdp = [
    {
      name                  = "Remote_Desktop_to_All"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["${local.beheer_cidr}"]
      destination_addresses = ["${local.beheer_cidr}"]
      destination_ports     = ["${local.services["rdp"]}"]
    },
    {
      name                  = "RDP_Allow_From_FSG-MAN-103_To_All"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["192.168.100.240"]
      destination_addresses = ["${local.beheer_cidr}"]
      destination_ports     = ["${local.services["rdp"]}"]
    }
  ]
}
