variable "metadata_block" {
  description = "Standard ingress's metadata."
  type        = object({
    annotations   = optional(map(string))
    generate_name = optional(string)
    labels        = optional(map(string))
    name          = optional(string)
  })
}

variable "role_ref_block" {
  description = "The ClusterRole to bind Subjects to."
  type        = object({
    name      = string
    kind      = string
    api_group = string
  })
}

variable "subject_blocks" {
  description = "The ClusterRole to bind Subjects to."
  type        = list(object({
    name      = string
    namespace = optional(string)
    kind      = string
    api_group = optional(string)
  }))
}