variable "name" {
  description = "The Name which should be used for this API Connection."
  type        = string
}

variable "chart" {
  description = "Chart name to be installed."
  type        = string
}

variable "repository" {
  description = "Repository URL where to locate the requested chart."
  type        = string
  default     = null
}

variable "repository_key_file" {
  description = "The repositories cert key file."
  type        = string
  default     = null
}

variable "repository_cert_file" {
  description = "The repositories cert file."
  type        = string
  default     = null
}

variable "repository_ca_file" {
  description = "The repositories CA file."
  type        = string
  default     = null
}

variable "repository_username" {
  description = "Username for HTTP basic authentication against the repository."
  type        = string
  default     = null
}

variable "repository_password" {
  description = "Password for HTTP basic authentication against the repository."
  type        = string
  default     = null
}

variable "devel" {
  description = "Use chart development versions, too."
  type        = string
  default     = null
}

variable "helm_version" {
  description = "Specify the exact chart version to install."
  type        = string
  default     = null
}

variable "namespace" {
  description = "The namespace to install the release into."
  type        = string
  default     = "default"
}

variable "verify" {
  description = "Verify the package before installing it."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.verify)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "keyring" {
  description = "Location of public keys used for verification."
  type        = string
  default     = null
}

variable "timeout" {
  description = "Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks)."
  type        = number
  default     = 300
}

variable "disable_webhooks" {
  description = "Prevent hooks from running."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.disable_webhooks)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "reuse_values" {
  description = "When upgrading, reuse the last release's values and merge in any overrides."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.reuse_values)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "reset_values" {
  description = "When upgrading, reset the values to the ones built into the chart."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.reset_values)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "force_update" {
  description = "Force resource update through delete/recreate if needed."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.force_update)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "recreate_pods" {
  description = "Perform pods restart during upgrade/rollback."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.recreate_pods)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "cleanup_on_fail" {
  description = "Allow deletion of new resources created in this upgrade when upgrade fails."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.cleanup_on_fail)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "max_history" {
  description = "Maximum number of release versions stored per release."
  type        = number
  default     = 0
}

variable "atomic" {
  description = "If set, installation process purges chart on fail."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.atomic)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "skip_crds" {
  description = "If set, no CRDs will be installed."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.skip_crds)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "render_subchart_notes" {
  description = "If set, render subchart notes along with the parent."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.render_subchart_notes)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = true
}

variable "disable_openapi_validation" {
  description = "If set, the installation process will not validate rendered templates against the Kubernetes OpenAPI Schema."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.disable_openapi_validation)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "wait" {
  description = "Will wait until all resources are in a ready state before marking the release as successful."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.wait)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = true
}

variable "wait_for_jobs" {
  description = "If wait is enabled, will wait until all Jobs have been completed before marking the release as successful."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.wait_for_jobs)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "values" {
  description = "List of values in raw yaml to pass to helm."
  type        = list(string)
  default     = null
}

variable "set_blocks" {
  description = "Value block with custom values to be merged with the values yaml."
  type        = list(object({
    name  = string
    value = string
    type  = optional(string)
  }))
  default = []
}

variable "set_list_blocks" {
  description = "Value block with list of custom values to be merged with the values yaml."
  type        = list(object({
    name  = string
    value = list(string)
  }))
  default = []
}

variable "set_sensitive_blocks" {
  description = "Value block with custom sensitive values to be merged with the values yaml that won't be exposed in the plan's diff."
  type        = list(object({
    name  = string
    value = list(string)
    type  = optional(string)
  }))
  default = []
}

variable "dependency_update" {
  description = "Runs helm dependency update before installing the chart."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.dependency_update)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "replace" {
  description = "Re-use the given name, only if that name is a deleted release which remains in the history."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.replace)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "description" {
  description = "Set release description attribute (visible in the history)."
  type        = string
  default     = null
}

variable "postrender_block" {
  description = "Configure a command to run after helm renders the manifest which can alter the manifest contents."
  type        = object({
    binary_path = string
    args        = optional(list(string))
  })
  default = null
}

variable "pass_credentials" {
  description = "Pass credentials to all domains."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.pass_credentials)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "lint" {
  description = "Run the helm chart linter during the plan."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.lint)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "create_namespace" {
  description = "Create the namespace if it does not yet exist."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.create_namespace)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}