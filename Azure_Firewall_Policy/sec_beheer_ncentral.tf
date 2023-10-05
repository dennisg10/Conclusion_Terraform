locals {
  sec_beheer_ncentral = [
    {
      name                  = "From_N-central_Probe_to_N-central_Server(OCC)"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.27.6"]
      destination_addresses = ["20.73.215.34"]
      destination_ports     = ["${local.services["ssh"]}", "${local.services["https"]}"]
    },
    {
      name                  = "From_N-central_Agents_to_N-central_Server(OCC)"
      protocols             = ["TCP"]
      source_addresses      = ["${local.beheer_cidr}"]
      destination_addresses = ["20.73.215.34"]
      destination_ports     = ["${local.services["ssh"]}", "${local.services["https"]}", "${local.services["ncentral_agent"]}"]
    },
    {
      name                  = "From_N-central_Agents_to_N-central_Server_Probe"
      protocols             = ["TCP"]
      source_addresses      = ["${local.beheer_cidr}", "10.50.0.0/16", "10.251.0.0/16"]
      destination_addresses = ["10.4.27.6"]
      destination_ports     = ["${local.services["ncentral_probe1"]}", "${local.services["ncentral_probe2"]}"]
    },
    {
      name                  = "Discovery_From_N-Central_Probe"
      protocols             = ["TCP"]
      source_addresses      = ["10.4.27.6"]
      destination_addresses = ["${local.beheer_cidr}", "10.50.0.0/16", "10.251.0.0/16"]
      destination_ports     = ["*"]
    }
  ]
}
