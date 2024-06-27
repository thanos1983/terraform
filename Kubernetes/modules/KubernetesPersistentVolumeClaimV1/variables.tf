variable "metadata_block" {
  description = "Standard secret's metadata."
  type = object({
    annotations = optional(map(string))
    generate_name = optional(string)
    labels = optional(map(string))
    name = optional(string)
    namespace = optional(string)
  })
}

variable "spec_block" {
  description = "Spec of the persistent volume owned by the cluster."
  type = object({
    access_modes = set(string)
    resources_block = object({
      limits = optional(map(string))
      requests = optional(map(string))
    })
    selector_block = optional(object({
      match_expressions_block = optional(object({
        key = optional(string)
        operator = optional(string)
        values = set(string)
      }), null)
      match_labels = optional(map(string))
    }), null)
    storage_class_name = optional(string)
    volume_mode = optional(string)
    volume_name = optional(string)
  })
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(string)
  })
  default = null
}