variable "name" {
  description = "Name of the desired host on which the playbook will be executed."
  type        = string
}

variable "playbook" {
  description = "Path to ansible playbook."
  type        = string
}

variable "ansible_playbook_binary" {
  description = "Path to ansible-playbook executable (binary)."
  type        = string
  default     = null
}

variable "check_mode" {
  description = "If 'true', playbook execution won't make any changes but only change predictions will be made."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.check_mode)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "diff_mode" {
  description = "If 'true', when changing (small) files and templates, differences in those files will be shown."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.diff_mode)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "extra_vars" {
  description = "A map of additional variables as: { key-1 = value-1, key-2 = value-2, … }."
  type = map(any)
  default     = null
}

variable "force_handlers" {
  description = "If 'true', run handlers even if a task fails."
  type        = bool
  default     = false
}

variable "groups" {
  description = "List of desired groups of hosts on which the playbook will be executed."
  type = list(string)
  default     = null
}

variable "ignore_playbook_failure" {
  description = "This parameter is good for testing."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.ignore_playbook_failure)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "limit" {
  description = "List of hosts to include in playbook execution."
  type = list(string)
  default     = null
}

variable "replayable" {
  description = "If 'true', the playbook will be executed on every 'terraform apply' and with that, the resource will be recreated."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.replayable)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "tags" {
  description = "List of tags of plays and tasks to run."
  type = list(string)
  default     = null
}

variable "var_files" {
  description = "List of variable files."
  type = list(string)
  default     = null
}

variable "vault_files" {
  description = "List of vault files."
  type = list(string)
  default     = null
}

variable "vault_id" {
  description = "ID of the desired vault(s)."
  type        = string
  default     = null
}

variable "vault_password_file" {
  description = "Path to a vault password file."
  type        = string
  default     = null
}

variable "verbosity" {
  description = "A verbosity level between 0 and 6."
  type        = number
  default     = 0
}

variable "timeouts_block" {
  description = "Timeouts block."
  type = object({
    create = string
  })
  default = null
}