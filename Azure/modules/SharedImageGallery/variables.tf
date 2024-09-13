variable "name" {
  description = "Specifies the name of the Shared Image Gallery."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Shared Image Gallery."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "description" {
  description = "A description for this Shared Image Gallery."
  type        = string
  default     = null
}

variable "sharing_block" {
  description = "A sharing block as defined below."
  type = object({
    permission = string
    community_gallery_block = optional(object({
      eula            = string
      prefix          = string
      publisher_email = string
      publisher_uri   = string
    }), null)
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the Shared Image Gallery."
  type        = map(string)
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