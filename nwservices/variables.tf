variable "rg_prefix" {
  description = "Resource Prefix Name"
}

variable "location" {
  description = "Resources Location"
}

variable "address_space_prefix" {
  description = "VNET address prefix"
}


variable "tags" {
  type = map(any)
}
