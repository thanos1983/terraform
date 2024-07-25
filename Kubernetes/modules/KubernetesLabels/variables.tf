variable "api_version" {
  description = "The apiVersion of the resource to label."
  type        = string
}

variable "kind" {
  description = "The kind of the resource to label."
  type        = string
}

variable "labels" {
  description = "A map of labels to apply to the resource."
  type = map(string)
}

variable "metadata_block" {
  description = "Standard ingress's metadata."
  type = object({
    name = string
    namespace = optional(string)
  })
}

variable "field_manager" {
  description = "Set the name of the field manager for the specified labels."
  type        = string
  default     = null
}

variable "force" {
  description = "Terraform will wait for the load balancer to have at least 1 endpoint before considering the resource created."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.force)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}