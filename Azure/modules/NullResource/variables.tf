variable "always_run" {
  description = "When to trigger the MS SQL Table Database Creation."
  type        = string
}

variable "command" {
  description = "Command to execute"
  type        = string
}

variable "working_dir" {
  description = "If provided, specifies the working directory where command will be executed."
  type        = string
  default     = null
}

variable "interpreter" {
  description = "If provided, this is a list of interpreter arguments used to execute the command."
  type        = list(string)
  default     = null
}

variable "environment" {
  description = "Block of key value pairs representing the environment of the executed command."
  type        = map(any)
  default     = null
}

variable "when" {
  description = "If when is specified, the provisioner will run when the resource it is defined within is created or destroyed."
  type        = string
  validation {
    condition     = contains(["create", "destroy"], lower(var.when))
    error_message = "Parameter must be \"create\" or \"destroy\" string."
  }
  default = "create"
}

variable "quiet" {
  description = "If set to true, Terraform will not print the command to be executed to stdout, and will instead print 'Suppressed by quiet=true'."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.quiet)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "inline" {
  description = "The user can execute multiple commands comma separated."
  type        = list(string)
  default     = []
}