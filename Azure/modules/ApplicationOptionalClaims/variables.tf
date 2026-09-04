variable "access_token_blocks" {
  description = "One or more access_token blocks as documented below."
  type = list(object({
    additional_properties = optional(list(string))
    essential             = optional(bool)
    name                  = string
    source                = optional(string)
  }))
  default = []
}

variable "application_id" {
  description = "The resource ID of the application registration."
  type        = string
}

variable "id_token_blocks" {
  description = "One or more id_token blocks as documented below."
  type = list(object({
    additional_properties = optional(list(string))
    essential             = optional(bool)
    name                  = string
    source                = optional(string)
  }))
  default = []
}

variable "saml2_token_blocks" {
  description = "One or more saml2_token blocks as documented below."
  type = list(object({
    additional_properties = optional(list(string))
    essential             = optional(bool)
    name                  = string
    source                = optional(string)
  }))
  default = []
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 10)
    read   = optional(number, 5)
    update = optional(number, 10)
    delete = optional(number, 5)
  })
  default = null
}
