variable "manifest" {
  description = "An object Kubernetes manifest describing the desired state of the resource in HCL format."
  type        = any
}

variable "computed_fields" {
  description = "List of paths of fields to be handled as 'computed'."
  type        = list(string)
  default     = null
}

variable "object" {
  description = "The resulting resource state, as returned by the API server after applying the desired state from manifest."
  type        = any
  default     = null
}

variable "wait_block" {
  description = "An object which allows you configure the provider to wait for specific fields to reach a desired value or certain conditions to be met."
  type        = object({
    rollout         = optional(bool)
    condition_block = optional(object({
      status = optional(string)
      type   = optional(string)
    }), null)
    fields = optional(map(any))
  })
  default = null
}

variable "field_manager_block" {
  description = "Configure field manager options."
  type        = object({
    name            = optional(string)
    force_conflicts = optional(bool)
  })
  default = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 10)
    update = optional(number, 10)
    delete = optional(number, 30)
  })
  default = null
}