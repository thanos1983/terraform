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

variable "rule_blocks" {
  description = "The PolicyRoles for this ClusterRole."
  type        = list(object({
    api_groups        = list(string)
    resources         = list(string)
    resource_names    = optional(list(string))
    verbs             = list(string)
  }))
  default = null
}