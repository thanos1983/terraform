variable "group_object_id" {
  description = "The object ID of the group you want to add the member to."
  type        = string
}

variable "member_object_id" {
  description = "The object ID of the principal you want to add as a member to the group."
  type        = string
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 5)
    read = optional(number, 5)
    delete = optional(number, 5)
  })
  default = null
}