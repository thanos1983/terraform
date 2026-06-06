variable "name" {
  description = "The name of the account that is displayed in the Cloudflare dashboard."
  type        = string
}

variable "settings" {
  description = "Account settings."
  type = object({
    abuse_contact_email = optional(string)
    enforce_twofactor   = optional(bool)
  })
  default = null
}

variable "managed_by" {
  description = "Parent container details."
  type = object({
    parent_org_id   = string
    parent_org_name = string
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
