variable "data_factory_id" {
  description = "The Data Factory ID in which to associate the Linked Service with."
  type        = string
}

variable "name" {
  description = "The name which should be used for this Data Factory."
  type        = string
}

variable "description" {
  description = "Integration runtime description."
  type        = string
  default     = null
}

variable "rbac_authorization_block" {
  description = "RBAC Authorization Block."
  type        = object({
    resource_id = string
  })
  default = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type        = object({
    create = optional(number, 60)
    read   = optional(number, 5)
    update = optional(number, 60)
    delete = optional(number, 60)
  })
  default = null
}