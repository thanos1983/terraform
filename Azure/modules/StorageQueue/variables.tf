variable "name" {
  description = "The name of the Queue which should be created within the Storage Account."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Storage Account where the Container should be created."
  type        = string
}

variable "metadata" {
  description = "A mapping of MetaData for this Container."
  type        = map(any)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}