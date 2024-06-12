variable "metadata_block" {
  description = "Standard ingress's metadata."
  type        = object({
    annotations   = optional(map(string))
    generate_name = optional(string)
    labels        = optional(map(string))
    name          = optional(string)
    namespace     = optional(string)
  })
}

variable "image_pull_secret_blocks" {
  description = "A list of references to secrets in the same namespace to use for pulling any images in pods that reference this Service Account."
  type        = list(object({
    name = optional(string)
  }))
  default = []
}

variable "secret_blocks" {
  description = "A list of secrets allowed to be used by pods running using this Service Account."
  type        = list(object({
    name = optional(string)
  }))
  default = []
}

variable "automount_service_account_token" {
  description = "Boolean, true to enable automatic mounting of the service account token."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.automount_service_account_token)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = true
}