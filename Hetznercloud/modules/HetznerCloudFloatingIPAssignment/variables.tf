variable "floating_ip_id" {
  description = "ID of the Floating IP."
  type        = string
}

variable "server_id" {
  description = "Server to assign the Floating IP to."
  type        = number
}
