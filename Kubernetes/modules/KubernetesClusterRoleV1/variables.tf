variable "metadata_block" {
  description = "Standard ingress's metadata."
  type        = object({
    annotations   = optional(map(string))
    generate_name = optional(string)
    labels        = optional(map(string))
    name          = optional(string)
  })
}

variable "rule_blocks" {
  description = "The PolicyRoles for this ClusterRole."
  type        = list(object({
    api_groups        = optional(list(string))
    non_resource_urls = optional(list(string))
    resource_names    = optional(list(string))
    resources         = optional(list(string))
    verbs             = list(string)
  }))
  default = null
}

variable "aggregation_rule_block" {
  description = "A list of selectors which will be used to find ClusterRoles and create the rules."
  type        = object({
    cluster_role_selectors_blocks = optional(list(object({
      match_expressions = optional(list(string))
      match_labels      = optional(map(string))
    })))
  })
  default = null
}