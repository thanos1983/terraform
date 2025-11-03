variable "role_definition_id" {
  description = "The Scoped-ID of the Role Definition."
  type        = string
  default     = null
}

variable "name" {
  description = "A unique UUID/GUID for this Role Assignment - one will be generated if not specified."
  type        = string
  default     = null
}

variable "scope" {
  description = "The scope at which the Role Assignment applies to."
  type        = string
}

variable "description" {
  description = "The description for this Role Assignment."
  type        = string
  default     = null
}

variable "permissions_block" {
  description = "A permissions block as defined below."
  type = object({
    actions          = optional(list(string))
    data_actions     = optional(list(string))
    not_actions      = optional(list(string))
    not_data_actions = optional(list(string))
  })
  default = null
}

variable "assignable_scopes" {
  description = "One or more assignable scopes for this Role Definition."
  type        = list(string)
  default     = null
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
