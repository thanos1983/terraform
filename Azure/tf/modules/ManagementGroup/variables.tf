variable "name" {
  description = "The name or UUID for this Management Group, which needs to be unique across your tenant."
  type        = string
  default     = null
}

variable "display_name" {
  description = "A friendly name for this Management Group."
  type        = string
  default     = var.name
}

variable "parent_management_group_id" {
  description = "The ID of the Parent Management Group."
  type        = string
  default     = null
}

variable "subscription_ids" {
  description = "A list of Subscription GUIDs which should be assigned to the Management Group."
  type        = list(string)
  default     = []
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