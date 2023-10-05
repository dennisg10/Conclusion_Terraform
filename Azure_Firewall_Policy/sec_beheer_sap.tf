locals {
  sec_beheer_sap = [
    {
      name                  = "from_facilicom-werkplek_to_SAP"
      protocols             = ["TCP"]
      source_addresses      = ["192.168.0.0/16", "198.180.64.0/20", "10.10.0.0/19", "172.31.252.0/22", "10.5.252.0/22", "10.168.103.0/24", "10.168.105.0/24", "10.168.106.0/24"]
      destination_addresses = ["10.1.49.0/24"]
      destination_ports     = ["${local.services["sap_ports1"]}", "${local.services["sap_ports2"]}"]
    }
  ]
}
