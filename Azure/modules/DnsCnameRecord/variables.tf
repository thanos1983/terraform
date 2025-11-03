variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where this Public IP should exist."
  type        = string
}

variable "zone_name" {
  description = "Specifies the DNS Zone where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "ttl" {
  description = "The Time To Live (TTL) of the DNS record in seconds."
  type        = number
}

variable "record" {
  description = "The target of the CNAME."
  type        = string
  default     = null
}

variable "target_resource_id" {
  description = "The Azure resource id of the target object."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}
