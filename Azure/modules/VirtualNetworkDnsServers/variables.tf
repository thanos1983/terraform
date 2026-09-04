variable "virtual_network_id" {
  description = "The ID of the Virtual Network that should be linked to the DNS Zone."
  type        = string
}

variable "dns_servers" {
  description = "List of IP addresses of DNS servers"
  type        = list(string)
  default     = []
}