variable "administrative_unit_ids" {
  description = "The object IDs of administrative units in which the group is a member."
  type = list(string)
  default     = null
}

variable "assignable_to_role" {
  description = "Indicates whether this group can be assigned to an Azure Active Directory role."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.assignable_to_role)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "auto_subscribe_new_members" {
  description = "Indicates whether new members added to the group will be auto-subscribed to receive email notifications."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.auto_subscribe_new_members)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "behaviors" {
  description = "Indicates whether new members added to the group will be auto-subscribed to receive email notifications."
  type        = string
  default     = null
}

variable "description" {
  description = "The description for the group."
  type        = string
  default     = null
}

variable "display_name" {
  description = "A display name for this API Connection."
  type        = string
  default     = null
}

variable "dynamic_membership_block" {
  description = "A dynamic_membership block as documented below."
  type        = object({

  })
  default     = null
}

variable "external_senders_allowed" {
  description = "Indicates whether people external to the organization can send messages to the group."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.external_senders_allowed)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 20)
    read = optional(number, 5)
    update = optional(number, 20)
    delete = optional(number, 5)
  })
  default = null
}