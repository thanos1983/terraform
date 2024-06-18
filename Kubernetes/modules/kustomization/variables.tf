variable "manifest" {
  description = "JSON encoded Kubernetes resource manifest."
  type        = string
}

variable "wait" {
  description = "Whether to wait for pods to become ready."
  type        = bool
  default     = false
}

variable "timeouts_block" {
  description = "Overwrite create, update or delete timeout defaults."
  type        = object({
    create = number
    update = number
    delete = number
  })
  default = null
}