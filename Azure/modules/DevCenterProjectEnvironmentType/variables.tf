variable "name" {
  description = "Specifies the name of this Dev Center."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Dev Center should exist."
  type        = string
}

variable "dev_center_project_id" {
  description = "The ID of the associated Dev Center Project."
  type        = string
}

variable "deployment_target_id" {
  description = "The ID of the subscription that the Environment Type will be mapped to."
  type        = string
}

variable "identity_block" {
  description = "An identity block as defined below."
  type = object({
    type = string
    identity_ids = optional(list(string))
  })
  default = {
    type = "SystemAssigned"
  }
}

variable "creator_role_assignment_roles" {
  description = "A list of roles to assign to the environment creator."
  type = list(string)
  default     = null
}

variable "user_role_assignment_block" {
  description = "An user_role_assignment block as defined below."
  type = object({
    user_id = string
    roles = list(string)
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Dev Center."
  type = map(any)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 30)
    delete = optional(number, 30)
    read = optional(number, 5)
    update = optional(number, 30)
  })
  default = null
}