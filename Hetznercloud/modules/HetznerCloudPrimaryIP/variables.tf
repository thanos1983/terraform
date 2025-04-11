variable "type" {
  description = "Type of the Primary IP."
  type        = string
}

variable "name" {
  description = "Name of the Network to create (must be unique per project)."
  type        = string
}

variable "datacenter" {
  description = "The datacenter name to create the resource in."
  type        = string
  default     = null
}

variable "auto_delete" {
  description = "Whether auto delete is enabled."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.auto_delete)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type = map(any)
  default     = null
}

variable "assignee_id" {
  description = "ID of the assigned resource."
  type        = number
  default     = null
}

variable "assignee_type" {
  description = "The type of the assigned resource."
  type        = number
  default     = null
}

variable "delete_protection" {
  description = "Enable or disable delete protection."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.delete_protection)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}
