variable "name" {
  description = "The Name which should be used for this Arc Resource Bridge Appliance."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the resource group where the Arc Resource Bridge Appliance exists."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Arc Resource Bridge Appliance should exist."
  type        = string
}

variable "distro" {
  description = "Specifies a supported Fabric/Infrastructure for this Arc Resource Bridge Appliance."
  type        = string
}

variable "identity_block" {
  description = "An identity block as defined below."
  type = object({
    type = string
  })
}

variable "infrastructure_provider" {
  description = "The infrastructure provider about the connected Arc Resource Bridge Appliance."
  type        = string
}

variable "public_key_base64" {
  description = "The public_key_base64 is an RSA public key in PKCS1 format encoded in base64."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the Arc Machine."
  type = map(any)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 60)
    read = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}