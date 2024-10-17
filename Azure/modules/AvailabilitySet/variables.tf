variable "name" {
  description = "Specifies the name of the Load Balancer"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Load Balancer."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the Load Balancer resource should be created."
  type        = string
}

variable "platform_update_domain_count" {
  description = "Specifies the number of update domains that are used."
  type        = number
  default     = 5
}

variable "platform_fault_domain_count" {
  description = "Specifies the number of fault domains that are used."
  type        = number
  default     = 3
}

variable "proximity_placement_group_id" {
  description = "The ID of the Proximity Placement Group to which this Virtual Machine should be assigned."
  type        = string
  default     = null
}

variable "managed" {
  description = "Specifies whether the availability set is managed or not."
  type        = bool
  validation {
    condition = contains(["true", "false"], tostring(lower(var.managed)))
    error_message = "Sku name must be \"true\" or \"false\"."
  }
  default = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type = map(any)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}