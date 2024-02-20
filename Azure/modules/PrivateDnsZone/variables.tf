variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where this Public IP should exist."
  type        = string
}

variable "soa_record_block" {
  description = "An soa_record block."
  type        = object({
    email        = string
    expire_time  = optional(number, 2419200)
    minimum_ttl  = optional(number, 10)
    refresh_time = optional(number, 3600)
    retry_time   = optional(number, 300)
    ttl          = optional(number, 3600)
    tags         = optional(map(any))
  })
  default = null
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

variable "private_dns_a_record_name" {
  description = "The name of the DNS A Record."
  type        = string
  default     = null
}

variable "zone_name" {
  description = "Specifies the Private DNS Zone where the resource exists."
  type        = string
  default     = null
}

variable "ttl" {
  description = "The Time To Live (TTL) of the DNS record in seconds."
  type        = number
  default     = null
}

variable "virtual_network_link_name" {
  description = "The name of the Private DNS Zone Virtual Network Link."
  type        = string
  default     = null
}

variable "registration_enabled" {
  description = "Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.registration_enabled)))
    error_message = "Possible values can be 'true' or 'false'."
  }
  default = false
}

variable "virtual_network_id" {
  description = "The ID of the Virtual Network that should be linked to the DNS Zone."
  type        = string
  default     = null
}

variable "records" {
  description = "List of IPv4 Addresses."
  type        = list(string)
  default     = null
}
