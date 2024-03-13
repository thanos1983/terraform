variable "triggers" {
  description = "A map of arbitrary strings that, when changed, will force the null resource to be replaced, re-running any associated provisioners."
  type        = map(string)
  default     = null
}

variable "type" {
  description = "The connection type. Valid values are 'ssh' and 'winrm'."
  type        = string
  default     = null
}

variable "user" {
  description = "The user to use for the connection."
  type        = string
  default     = null
}

variable "password" {
  description = "The password to use for the connection."
  type        = string
  default     = null
}

variable "host" {
  description = "The address of the resource to connect to."
  type        = string
  default     = null
}

variable "timeout" {
  description = "The timeout to wait for the connection to become available. Should be provided as a string (e.g., '30s' or '5m'.)"
  type        = string
  default     = null
}

variable "script_path" {
  description = "The path used to copy scripts meant for remote execution."
  type        = string
  default     = null
}

variable "private_key" {
  description = "The contents of an SSH key to use for the connection."
  type        = string
  default     = null
}

variable "certificate" {
  description = "The contents of a signed CA Certificate. The certificate argument must be used in conjunction with a private_key."
  type        = string
  default     = null
}

variable "agent" {
  description = "Set to false to disable using ssh-agent to authenticate."
  type        = bool
  default     = null
}

variable "agent_identity" {
  description = "The preferred identity from the ssh agent for authentication."
  type        = string
  default     = null
}

variable "host_key" {
  description = "The public key from the remote host or the signing CA, used to verify the connection."
  type        = string
  default     = null
}

variable "target_platform" {
  description = "The target platform to connect to. Valid values are 'windows' and 'unix'."
  type        = string
  default     = null
}

variable "https" {
  description = "Set to true to connect using HTTPS instead of HTTP."
  type        = bool
  default     = null
}

variable "insecure" {
  description = "Set to true to skip validating the HTTPS certificate chain."
  type        = bool
  default     = null
}

variable "use_ntlm" {
  description = "Set to true to use NTLM authentication rather than default (basic authentication), removing the requirement for basic authentication to be enabled within the target guest."
  type        = bool
  default     = null
}

variable "cacert" {
  description = "Set to true to use NTLM authentication rather than default (basic authentication), removing the requirement for basic authentication to be enabled within the target guest."
  type        = string
  default     = null
}

variable "port" {
  description = "The port to connect to."
  type        = string
  default     = null
}

variable "file_source" {
  description = "The source file or directory. Specify it either relative to the current working directory or as an absolute path."
  type        = string
  default     = null
}

variable "file_content" {
  description = "The direct content to copy on the destination. If destination is a file, the content will be written on that file."
  type        = string
  default     = null
}

variable "file_destination" {
  description = "The destination path to write to on the remote system."
  type        = string
  default     = null
}

variable "command" {
  description = "Command to execute"
  type        = string
  default     = null
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
  type        = map(string)
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
  description = "This is a list of command strings. The provisioner uses a default shell unless you specify a shell as the first command (eg., #!/bin/bash)."
  type        = list(string)
  default     = []
}

variable "script" {
  description = "This is a path (relative or absolute) to a local script that will be copied to the remote resource and then executed."
  type        = string
  default     = null
}

variable "scripts" {
  description = "This is a list of paths (relative or absolute) to local scripts that will be copied to the remote resource and then executed."
  type        = list(string)
  default     = null
}