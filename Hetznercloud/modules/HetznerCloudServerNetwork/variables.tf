variable "server_id" {
  description = "ID of the server."
  type        = string
}

variable "alias_ips" {
  description = "Additional IPs to be assigned to this server."
  type = list(string)
  default = []
}

variable "network_id" {
  description = "ID of the network which should be added to the server. "
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "ID of the sub-network which should be added to the Server."
  type        = string
  default     = null
}

variable "ip" {
  description = "IP to request to be assigned to this server."
  type        = string
  default     = null
}
