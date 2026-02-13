variable "administrative_unit_ids" {
  description = "The object IDs of administrative units in which the group is a member."
  type        = list(string)
  default     = null
}

variable "assignable_to_role" {
  description = "Indicates whether this group can be assigned to an Azure Active Directory role."
  type        = bool
  default     = false
}

variable "auto_subscribe_new_members" {
  description = "Indicates whether new members added to the group will be auto-subscribed to receive email notifications."
  type        = bool
  default     = false
}

variable "behaviors" {
  description = "A set of behaviors for a Microsoft 365 group."
  type        = set(string)
  default     = null
}

variable "description" {
  description = "The description for the group."
  type        = string
  default     = null
}

variable "display_name" {
  description = "The display name for the group."
  type        = string
}

variable "dynamic_membership_block" {
  description = "A dynamic_membership block as documented below."
  type = object({
    enabled = bool
    rule    = string
  })
  default = null
}

variable "external_senders_allowed" {
  description = "Indicates whether people external to the organization can send messages to the group."
  type        = bool
  default     = false
}

variable "hide_from_address_lists" {
  description = "Indicates whether the group is displayed in certain parts of the Outlook."
  type        = bool
  default     = false
}

variable "hide_from_outlook_clients" {
  description = "Indicates whether the group is displayed in Outlook clients, such as Outlook."
  type        = bool
  default     = false
}

variable "mail_enabled" {
  description = "Whether the group is a mail enabled, with a shared group mailbox."
  type        = bool
  default     = false
}

variable "mail_nickname" {
  description = "The mail alias for the group, unique in the organisation. Required for mail-enabled groups."
  type        = string
  default     = null
}

variable "members" {
  description = "A set of members who should be present in this group."
  type        = set(string)
  default     = null
}

variable "onpremises_group_type" {
  description = "The on-premises group type that the AAD group will be written as, when writeback is enabled."
  type        = string
  default     = null
}

variable "owners" {
  description = "A set of object IDs of principals that will be granted ownership of the group."
  type        = set(string)
  default     = null
}

variable "prevent_duplicate_names" {
  description = "If true, will return an error if an existing group is found with the same name."
  type        = bool
  default     = false
}

variable "provisioning_options" {
  description = "A set of provisioning options for a Microsoft 365 group."
  type        = set(string)
  default     = null
}

variable "security_enabled" {
  description = "Whether the group is a security group for controlling access to in-app resources."
  type        = bool
  default     = false
}

variable "theme" {
  description = "The colour theme for a Microsoft 365 group."
  type        = string
  default     = null
}

variable "types" {
  description = "A set of group types to configure for the group."
  type        = set(string)
  default     = null
}

variable "visibility" {
  description = "The group join policy and group content visibility."
  type        = string
  default     = null
}

variable "writeback_enabled" {
  description = "Whether the group will be written back to the configured on-premises Active Directory when Azure AD Connect is used."
  type        = bool
  default     = false
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 20)
    read   = optional(number, 5)
    update = optional(number, 20)
    delete = optional(number, 20)
  })
  default = null
}
