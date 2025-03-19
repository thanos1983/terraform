variable "name" {
  description = "The name of the account that is displayed in the Cloudflare dashboard."
  type        = string
}

variable "type" {
  description = "Account type."
  type        = string
}

variable "settings" {
  description = "Account settings."
  type = object({
    abuse_contact_email = optional(string)
    default_nameservers = optional(string)
    cloudlfare = optional(object({
      standard = optional(string)
    }))
    custom = optional(object({
      account = optional(string)
      tenant  = optional(string)
    }))
  })
  default = null
}

variable "unit" {
  description = "Information related to the tenant unit, and optionally, an id of the unit to create the account on."
  type = object({
    id = optional(string)
  })
  default = null
}
