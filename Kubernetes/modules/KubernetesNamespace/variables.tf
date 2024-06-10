variable "metadata_block" {
  description = "Standard secret's metadata."
  type        = object({
    annotations   = optional(map(string))
    generate_name = optional(string)
    labels        = optional(map(string))
    name          = optional(string)
  })
}

variable "wait_for_default_service_account" {
  description = "When set to true Terraform will wait until the default service account has been asynchronously created by Kubernetes when creating the namespace resource."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.wait_for_default_service_account)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    delete = optional(number, 5)
  })
  default = null
}