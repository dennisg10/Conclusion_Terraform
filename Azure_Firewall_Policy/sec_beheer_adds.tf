locals {
  sec_beheer_adds = [
    {
      name                  = "Domain_Controller_Replication"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["10.4.20.5", "10.4.20.6", "10.4.20.7", "10.4.20.8", "192.168.100.3", "192.168.100.4", "192.168.100.19", "192.168.100.21", "192.168.100.30", "192.168.200.81", "192.168.200.88"]
      destination_addresses = ["10.4.20.5", "10.4.20.6", "10.4.20.7", "10.4.20.8", "192.168.100.3", "192.168.100.4", "192.168.100.19", "192.168.100.21", "192.168.100.30", "192.168.200.81", "192.168.200.88"]
      destination_ports     = ["${local.services["dns"]}", "${local.services["kerberos"]}", "${local.services["ntp"]}", "${local.services["rpc"]}", "${local.services["kerberos_authentication"]}", "${local.services["ldap"]}", "${local.services["smb"]}", "${local.services["ldaps"]}", "${local.services["mgc"]}", "${local.services["mgcs"]}", "${local.services["wsm"]}", "4152-65535"]
    },
    {
      name                  = "Domain_Controller_Access"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["${local.beheer_cidr}", "${local.vpn_cidr}"]
      destination_addresses = ["10.4.20.5", "10.4.20.6", "10.4.20.7", "10.4.20.8", "192.168.100.3", "192.168.100.4", "192.168.100.19", "192.168.100.21", "192.168.100.30", "192.168.200.81", "192.168.200.88"]
      destination_ports     = ["${local.services["dns"]}", "${local.services["kerberos"]}", "${local.services["ntp"]}", "${local.services["rpc"]}", "${local.services["kerberos_authentication"]}", "${local.services["ldap"]}", "${local.services["smb"]}", "${local.services["ldaps"]}", "${local.services["mgc"]}", "${local.services["mgcs"]}", "${local.services["wsm"]}", "4152-65535"]
    },
    {
      name                  = "Domain_Controllers_ICMP"
      protocols             = ["ICMP"]
      source_addresses      = ["10.4.20.5", "10.4.20.6", "10.4.20.7", "10.4.20.8", "192.168.100.3", "192.168.100.4", "192.168.100.19", "192.168.100.21", "192.168.100.30", "192.168.200.81", "192.168.200.88"]
      destination_addresses = ["10.4.20.5", "10.4.20.6", "10.4.20.7", "10.4.20.8", "192.168.100.3", "192.168.100.4", "192.168.100.19", "192.168.100.21", "192.168.100.30", "192.168.200.81", "192.168.200.88"]
      destination_ports     = ["${local.services["icmp"]}"]
    }

  ]
}
