variable "name" {
  description = "Specifies the name of this Dev Center."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the name of the Resource Group within which this Dev Center should exist."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Dev Center should exist."
  type        = string
}

variable "domain_join_type" {
  description = "The Azure Active Directory Join type."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the Subnet that is used to attach Virtual Machines."
  type        = string
}

variable "domain_name" {
  description = "The name of the Azure Active Directory domain."
  type        = string
  default     = null
}

variable "domain_password" {
  description = "The password for the account used to join domain."
  type        = string
  default     = null
}

variable "domain_username" {
  description = "The username of the Azure Active Directory account (user or service account) that has permissions to create computer objects in Active Directory."
  type        = string
  default     = null
}

variable "organization_unit" {
  description = "The Azure Active Directory domain Organization Unit (OU)."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Dev Center Network Connection."
  type        = map(any)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 30)
    delete = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
  })
  default = null
}
