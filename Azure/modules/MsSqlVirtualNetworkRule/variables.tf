variable "name" {
  description = "The name of the SQL virtual network rule."
  type        = string
}

variable "server_id" {
  description = "The resource ID of the SQL Server to which this SQL virtual network rule will be applied."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet from which the SQL server will accept communications."
  type        = string
}

variable "ignore_missing_vnet_service_endpoint" {
  description = "Create the virtual network rule before the subnet has the virtual network service endpoint enabled."
  type        = bool
  default     = false
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}