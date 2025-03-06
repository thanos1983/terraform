variable "name" {
  description = "The custom role name."
  type        = string
}

variable "description" {
  description = "Additional long description."
  type        = string
  default     = null
}

variable "permissions_block" {
  description = "Block to define monitor and secure permissions."
  type = object({
    monitor_permissions = optional(set(string))
    secure_permissions = optional(set(string))
  })
}
