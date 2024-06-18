variable "yaml_body" {
  description = "YAML to apply to kubernetes."
  type        = string
}

variable "sensitive_fields" {
  description = "List of fields (dot-syntax) which are sensitive and should be obfuscated in output."
  type        = list(string)
  default     = null
}

variable "force_new" {
  description = "Forces delete & create of resources if the yaml_body changes."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.force_new)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "server_side_apply" {
  description = "Allow using server-side-apply method."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.server_side_apply)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "field_manager" {
  description = "Override the default field manager name."
  type        = string
  default     = "kubectl"
}

variable "force_conflicts" {
  description = "Allow using force_conflicts."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.force_conflicts)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "apply_only" {
  description = "It does not delete resource in any case Default false."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.apply_only)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "ignore_fields" {
  description = "List of map fields to ignore when applying the manifest."
  type        = list(string)
  default     = null
}

variable "override_namespace" {
  description = "Override the namespace to apply the kubernetes resource to, ignoring any declared namespace in the yaml_body."
  type        = string
  default     = null
}

variable "validate_schema" {
  description = "Setting to false will mimic kubectl apply --validate=false mode."
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.validate_schema)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "wait" {
  description = "Set this flag to wait or not for finalized to complete for deleted objects."
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.wait)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "wait_for_rollout" {
  description = "Set this flag to wait or not for Deployments and APIService to complete rollout."
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.wait_for_rollout)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "wait_for_block" {
  description = "Set this flag to wait or not for Deployments and APIService to complete rollout."
  type        = list(object({
    field_blocks = optional(list(object({
      key        = string
      value      = string
      value_type = optional(string)
    })))
  }))
  default = []
}