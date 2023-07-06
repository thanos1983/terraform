variable "name" {
  description = "The name of the firewall rule."
  type        = string
}

variable "server_id" {
  description = "The resource ID of the SQL Server on which to create the Firewall Rule."
  type        = string
}

variable "start_ip_address" {
  description = "The starting IP address to allow through the firewall for this rule."
  type        = string
}

variable "end_ip_address" {
  description = "The ending IP address to allow through the firewall for this rule."
  type        = string
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}