variable "subscription_name" {
  description = "The Name of the Subscription. This is the Display Name in the portal."
  type        = string
}

variable "alias" {
  description = "The Alias name for the subscription."
  type        = string
  default     = null
}

variable "billing_scope_id" {
  description = "The Azure Billing Scope ID."
  type        = string
  default     = null
}

variable "subscription_id" {
  description = "The ID of the Subscription."
  type        = string
  default     = null
}

variable "workload" {
  description = "The workload type of the Subscription."
  type        = string
  validation {
    condition     = contains(["Production", "ASPath"], title(var.workload))
    error_message = "Possible values can be \"Production\" or \"DevTest\"."
  }
  default = "Production"
}

variable "tags" {
  description = "A mapping of tags to assign to the Subscription."
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