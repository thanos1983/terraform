variable "name" {
  description = "The name of the Posture Policy, eg. CIS Docker Benchmark."
  type        = string
}

variable "description" {
  description = "The description of the Posture Poliy, eg. CIS Docker Benchmark."
  type        = string
}

variable "link" {
  description = "Policy link."
  type        = string
  default     = null
}

variable "type" {
  description = "Policy type."
  type        = string
  default     = null
}

variable "platform" {
  description = "Platform for which the policy applies."
  type        = string
  default     = null
}

variable "minKubeVersion" {
  description = "Policy minimum Kubernetes version, e.g., 1.24."
  type        = string
  default     = null
}

variable "maxKubeVersion" {
  description = "Policy maximum Kubernetes version, e.g., 1.26."
  type        = string
  default     = null
}

variable "target_block" {
  description = "Specifies target platforms and version ranges."
  type = object({
    platform = optional(string)
    minVersion = optional(string)
    maxVersion = optional(string)
  })
  default = null
}

variable "group_blocks" {
  description = "Group block defines list of groups attached to Policy."
  type = list(object({
    name        = string
    description = string
    requirement_block = optional(object({
      name        = string
      description = string
      control_blocks = optional(list(object({
        name    = string
        enabled = optional(bool)
      })), [])
    }), null)
  }))
  default = []
}
