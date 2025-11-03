variable "location" {
  description = "The Azure Region where the Virtual Machine Run Command should exist."
  type        = string
}

variable "name" {
  description = "Specifies the name of this Virtual Machine Run Command."
  type        = string
}

variable "virtual_machine_id" {
  description = "Specifies the Virtual Machine ID within which this Virtual Machine Run Command should exist."
  type        = string
}

variable "source_block" {
  description = "A source block as defined below."
  type = object({
    command_id = optional(string)
    script     = optional(string)
    script_uri = optional(string)
    script_uri_managed_identity = optional(object({
      client_id = optional(string)
      object_id = optional(string)
    }))
  })
}

variable "error_blob_managed_identity_block" {
  description = "An error_blob_managed_identity block as defined below."
  type = object({
    client_id = optional(string)
    object_id = optional(string)
  })
  default = null
}

variable "output_blob_managed_identity_block" {
  description = "An output_blob_managed_identity block as defined below."
  type = object({
    client_id = optional(string)
    object_id = optional(string)
  })
  default = null
}

variable "output_blob_uri" {
  description = "Specifies the Azure storage blob where script output stream will be uploaded."
  type        = string
  default     = null
}

variable "parameter_blocks" {
  description = "A list of parameter blocks as defined below."
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "protected_parameter_blocks" {
  description = "A list of protected_parameter blocks as defined below."
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "run_as_password" {
  description = "Specifies the user account password on the VM when executing the Virtual Machine Run Command."
  type        = bool
  default     = null
}

variable "run_as_user" {
  description = "Specifies the user account on the VM when executing the Virtual Machine Run Command."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
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
