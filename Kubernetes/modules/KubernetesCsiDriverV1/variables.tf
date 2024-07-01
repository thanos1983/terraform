variable "metadata_block" {
  description = "Standard ingress's metadata."
  type = object({
    annotations = optional(map(string))
    generate_name = optional(string)
    labels = optional(map(string))
    name = optional(string)
  })
}

variable "spec_block" {
  description = "Spec of the CSI Driver."
  type = object({
    attach_required = bool
    pod_info_on_mount = optional(bool)
    volume_lifecycle_modes = optional(list(string))
  })
}