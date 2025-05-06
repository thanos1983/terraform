variable "name" {
  description = "Specifies the name which should be used for this Arc Kubernetes Cluster Extension."
  type        = string
}

variable "cluster_id" {
  description = "Specifies the Cluster ID."
  type        = string
}

variable "extension_type" {
  description = "Specifies the type of extension."
  type        = string
}

variable "configuration_protected_settings" {
  description = "Configuration settings that are sensitive, as name-value pairs for configuring this extension."
  type = map(any)
  default     = null
}

variable "configuration_settings" {
  description = "Configuration settings, as name-value pairs for configuring this extension."
  type = map(any)
  default     = null
}

variable "identity_block" {
  description = "An identity block as defined below."
  type = object({
    type = string
  })
}

variable "release_train" {
  description = "The release train used by this extension."
  type        = string
  default     = null
}

variable "release_namespace" {
  description = "Namespace where the extension release must be placed for a cluster scoped extension."
  type        = string
  default     = null
}

variable "target_namespace" {
  description = "Namespace where the extension will be created for a namespace scoped extension."
  type        = string
  default     = null
}

variable "extension_version" {
  description = "User-specified version that the extension should pin to."
  type        = string
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 30)
    read = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}
