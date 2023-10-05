locals {
  sec_beheer_aad-ds = [
    {
      name                  = "Domain_Controller_Access"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["*"]
      destination_addresses = ["10.4.17.68", "10.4.17.69"]
      destination_ports     = ["${local.services["dns"]}", "${local.services["kerberos"]}", "${local.services["ntp"]}", "${local.services["smb"]}", "${local.services["rpc"]}", "${local.services["ldap"]}", "${local.services["ldaps"]}", "${local.services["kerberos_authentication"]}", "${local.services["mgc"]}", "${local.services["mgcs"]}", "${local.services["wsm"]}", "49152-65535"]
    }
  ]
}
