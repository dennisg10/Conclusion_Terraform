locals {

  # Prefixes
  nw_prefix = {
    vnet      = "10.4"
    vnet-plc  = "10.4"
    vnet-pli  = "10.4"
    vnet-plm  = "10.4"
    vnet-g01d = "10.4"
    vnet-g01t = "10.4"
    vnet-g01a = "10.4"
    vnet-g01p = "10.4"
    vpn       = "10.5"
  }
  # Subnet cidr
  nw_cidr = {
    azurebastion-plm   = "${local.nw_prefix["vnet-plm"]}.25.0/26"
    applicationgw-plm  = "${local.nw_prefix["vnet-plm"]}.26.0/26"
    priv-endpoints-plm = "${local.nw_prefix["vnet-plm"]}.26.128/25"
    mmgmt-plm          = "${local.nw_prefix["vnet-plm"]}.27.0/26"
    frontend-plm       = "${local.nw_prefix["vnet-plm"]}.27.128/25"
    backend-plm        = "${local.nw_prefix["vnet-plm"]}.8.0/24"

    azurebastion-pli   = "${local.nw_prefix["vnet-pli"]}.17.0/26"
    domainservices-pli = "${local.nw_prefix["vnet-pli"]}.17.64/27"
    applicationgw-pli  = "${local.nw_prefix["vnet-pli"]}.18.0/26"
    priv-endpoints-pli = "${local.nw_prefix["vnet-pli"]}.18.128/25"
    mmgmt-pli          = "${local.nw_prefix["vnet-pli"]}.19.0/26"
    frontend-pli       = "${local.nw_prefix["vnet-pli"]}.19.128/25"
    backend-pli        = "${local.nw_prefix["vnet-pli"]}.20.0/24"

    azurebastion-plc   = "${local.nw_prefix["vnet-plc"]}.0.0/26"
    applicationgw-plc  = "${local.nw_prefix["vnet-plc"]}.0.128/26"
    priv-endpoints-plc = "${local.nw_prefix["vnet-plc"]}.2.128/25"
    mmgmt-plc          = "${local.nw_prefix["vnet-plc"]}.3.0/26"
    frontend-plc       = "${local.nw_prefix["vnet-plc"]}.3.128/25"
    backend-plc        = "${local.nw_prefix["vnet-plc"]}.4.0/24"

    azurebastion-g01d   = "${local.nw_prefix["vnet-g01d"]}.49.0/26"
    priv-endpoints-g01d = "${local.nw_prefix["vnet-g01d"]}.54.128/25"
    applicationgw-g01d  = "${local.nw_prefix["vnet-g01d"]}.55.0/25"
    db-services-g01d    = "${local.nw_prefix["vnet-g01d"]}.56.0/25"
    mgmt-subnet-g01d    = "${local.nw_prefix["vnet-g01d"]}.57.0/26"
    frontend-g01d       = "${local.nw_prefix["vnet-g01d"]}.58.0/25"
    backend-g01d        = "${local.nw_prefix["vnet-g01d"]}.59.0/24"

    azurebastion-g01t   = "${local.nw_prefix["vnet-g01t"]}.65.0/26"
    priv-endpoints-g01t = "${local.nw_prefix["vnet-g01t"]}.70.128/25"
    applicationgw-g01t  = "${local.nw_prefix["vnet-g01t"]}.71.0/25"
    db-services-g01t    = "${local.nw_prefix["vnet-g01t"]}.72.0/25"
    mgmt-subnet-g01t    = "${local.nw_prefix["vnet-g01t"]}.73.0/26"
    frontend-g01t       = "${local.nw_prefix["vnet-g01t"]}.74.0/25"
    backend-g01t        = "${local.nw_prefix["vnet-g01t"]}.75.0/24"

    azurebastion-g01a   = "${local.nw_prefix["vnet-g01a"]}.81.0/26"
    priv-endpoints-g01a = "${local.nw_prefix["vnet-g01a"]}.86.128/25"
    applicationgw-g01a  = "${local.nw_prefix["vnet-g01a"]}.87.0/25"
    db-services-g01a    = "${local.nw_prefix["vnet-g01a"]}.88.0/25"
    mgmt-subnet-g01a    = "${local.nw_prefix["vnet-g01a"]}.89.0/26"
    frontend-g01a       = "${local.nw_prefix["vnet-g01a"]}.90.0/25"
    backend-g01a        = "${local.nw_prefix["vnet-g01a"]}.91.0/24"

    azurebastion-g01p   = "${local.nw_prefix["vnet-g01p"]}.33.0/26"
    priv-endpoints-g01p = "${local.nw_prefix["vnet-g01p"]}.38.128/25"
    applicationgw-g01p  = "${local.nw_prefix["vnet-g01p"]}.39.0/25"
    db-services-g01p    = "${local.nw_prefix["vnet-g01p"]}.40.0/25"
    mgmt-subnet-g01p    = "${local.nw_prefix["vnet-g01p"]}.41.0/26"
    frondend-g01p       = "${local.nw_prefix["vnet-g01p"]}.42.0/25"
    backend-g01p        = "${local.nw_prefix["vnet-g01p"]}.43.0/24"

  }

  # VPN
  vpn_cidr = "${local.nw_prefix["vpn"]}.252.0/22"

  #Customer Onpremise Adresses
  customer_cidr = {
    onpremise1 = "192.168.0.0/16"
    onpremise2 = "198.180.64.0/20"
    onpremise3 = "10.10.0.0/19"
    vpn        = "10.5.252.0/22"
    onpremise4 = "10.168.103.0/24"
    onpremise5 = "10.168.105.0/24"
    onpremise6 = "10.168.106.0/24"
  }

  # Beheer
  beheer_cidr = "${local.nw_prefix["vnet"]}.0.0/16"

  #Applications Servers






  # Service ports
  services = {
    icmp                    = "*"
    ssh                     = "22"
    smtp                    = "25"
    readsoft                = "33"
    dns                     = "53"
    http                    = "80"
    kerberos                = "88"
    ntp                     = "123"
    rpc                     = "135"
    netbios                 = "137-139"
    snmp                    = "161"
    ldap                    = "389"
    https                   = "443"
    smb                     = "445"
    kerberos_authentication = "464"
    printing_port1          = "515"
    ldaps                   = "636"
    netconf                 = "830"
    oms                     = "1159"
    msql                    = "1433"
    oracle                  = "1521"
    kms                     = "1688"
    mgc                     = "3268"
    mgcs                    = "3269"
    sap_ports1              = "3200-3299"
    sap_ports2              = "3300-3399"
    mysql                   = "3306"
    rdp                     = "3389"
    ncentral_agent          = "5280"
    printing_port2          = "9100"
    wsm                     = "9389"
    ncentral_probe1         = "10004"
    zabbix_proxy1           = "10050"
    zabbix_proxy2           = "10051"
    ncentral_probe2         = "15000"
    zabbix_sqlport1         = "49341"
    zabbix_sqlport2         = "49305"
    cypress_ports           = "11486-11488"
    sta_port1               = "18001"
    sta_port2               = "18004"
    sta_port3               = "58104"
    sta_port4               = "58105"
  }
}
