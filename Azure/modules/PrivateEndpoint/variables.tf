variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where this Public IP should exist."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint."
  type        = string
}

variable "custom_network_interface_name" {
  description = "The custom name of the network interface attached to the private endpoint."
  type        = string
  default     = null
}

variable "private_dns_zone_group_block" {
  description = "A private_dns_zone_group block as defined below."
  type        = object({
    name                 = string
    private_dns_zone_ids = list(string)
  })
  default = null
}

variable "private_service_connection_block" {
  description = "A private_service_connection block as defined below."
  type        = list(object({
    name                              = string
    is_manual_connection              = bool
    private_connection_resource_id    = optional(string)
    private_connection_resource_alias = optional(string)
    subresource_names                 = optional(list(string))
    request_message                   = optional(string)
  }))
}

variable "ip_configuration_blocks" {
  description = "One or more ip_configuration blocks as defined below."
  type        = list(object({
    name               = string
    private_ip_address = string
    subresource_name   = optional(string)
    member_name        = optional(string)
  }))
  default = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
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