variable "name" {
  description = "The name of the account that is displayed in the Cloudflare dashboard."
  type        = string
}

variable "type" {
  description = "Account type."
  type        = string
}

variable "unit_block" {
  description = "Information related to the tenant unit, and optionally, an id of the unit to create the account on."
  type = object({
    id = optional(string)
  })
  default = null
}

variable "settings_block" {
  description = "Account settings block."
  type = object({
    abuse_contact_email = optional(string)
    default_nameservers = optional(string)
    cloudlfare_block = optional(object({
      standard = optional(list(string))
    }))
    custom_block = optional(object({
      account = optional(list(string))
      tenant = optional(list(string))
    }))
  })
  default = null
}