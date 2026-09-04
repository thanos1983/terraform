variable "app_role_id" {
  description = "The ID of the app role to be assigned, or the default role ID 00000000-0000-0000-0000-000000000000."
  type        = string
}

variable "principal_object_id" {
  description = "The object ID of the user, group or service principal to be assigned this app role."
  type        = string
}

variable "resource_object_id" {
  description = "The object ID of the service principal representing the resource."
  type        = string
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 5)
    read   = optional(number, 5)
    delete = optional(number, 5)
  })
  default = null
}
