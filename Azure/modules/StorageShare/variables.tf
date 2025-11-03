variable "name" {
  description = "The name of the share."
  type        = string
}

variable "storage_account_name" {
  description = "Specifies the storage account in which to create the share."
  type        = string
}

variable "access_tier" {
  description = "The access tier of the File Share."
  type        = string
  validation {
    condition     = contains(["Hot", "Cool", "TransactionOptimized", "Premium"], title(var.access_tier))
    error_message = "Possible values are \"Hot\", \"Cool\", \"Premium\" and \"TransactionOptimized\"."
  }
  default = "Cool"
}

variable "acl_blocks" {
  description = "One or more acl blocks as defined below."
  type = list(object({
    id = string
    access_policy = optional(object({
      permissions = string
      start       = optional(string)
      expiry      = optional(string)
    }), null)
  }))
  default = []
}

variable "enabled_protocol" {
  description = "The protocol used for the share."
  type        = string
  validation {
    condition     = contains(["SMB", "NFS"], upper(var.enabled_protocol))
    error_message = "Possible values are \"SMB\" and \"NFS\"."
  }
  default = "SMB"
}

variable "quota" {
  description = "The maximum size of the share, in gigabytes."
  type        = number
}

variable "metadata" {
  description = "A mapping of MetaData for this File Share."
  type        = object({})
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
