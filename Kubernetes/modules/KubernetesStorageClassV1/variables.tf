variable "metadata_block" {
  description = "Standard ingress's metadata."
  type = object({
    annotations = optional(map(string))
    generate_name = optional(string)
    labels = optional(map(string))
    name = optional(string)
  })
}

variable "storage_provisioner" {
  description = "Indicates the type of the provisioner."
  type        = string
}

variable "allow_volume_expansion" {
  description = "Indicates whether the storage class allow volume expand."
  type        = bool
  default     = false
}

variable "allowed_topologies_block" {
  description = "Restrict the node topologies where volumes can be dynamically provisioned."
  type = object({
    match_label_expressions_block = optional(object({
      key = optional(string)
      values = optional(set(string))
    }), null)
  })
  default = null
}

variable "mount_options" {
  description = "Restrict the node topologies where volumes can be dynamically provisioned."
  type = set(string)
  default     = null
}

variable "parameters" {
  description = "The parameters for the provisioner that should create volumes of this storage class."
  type = map(string)
  default     = null
}

variable "reclaim_policy" {
  description = "Indicates the type of the reclaim policy."
  type        = string
  default     = null
}

variable "volume_binding_mode" {
  description = "Indicates when volume binding and dynamic provisioning should occur."
  type        = string
  default     = null
}