variable "network_id" {
  description = "ID of the Network the subnet should be added to."
  type        = string
}

variable "type" {
  description = "Type of subnet."
  type        = string
}

variable "ip_range" {
  description = "Range to allocate IPs from."
  type        = string
}

variable "network_zone" {
  description = "Name of network zone."
  type        = string
}

variable "vswitch_id" {
  description = "ID of the vswitch, Required if type is vswitch."
  type        = string
  default     = null
}
