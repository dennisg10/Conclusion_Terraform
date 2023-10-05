locals {
  sec_beheer_mgmt_servers = [
    {
      name                  = "from_Management_Servers"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.27.5"]
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }
  ]
}
