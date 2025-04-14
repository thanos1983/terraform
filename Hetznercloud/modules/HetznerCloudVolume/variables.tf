variable "name" {
  description = "Name of the volume to create (must be unique per project)."
  type        = string
}

variable "size" {
  description = "Size of the volume (in GB)."
  type        = number
}

variable "labels" {
  description = "User-defined labels (key-value pairs)."
  type = map(any)
  default     = null
}

variable "server_id" {
  description = "Server to attach the Volume to, not allowed if location argument is passed."
  type        = string
  default     = null
}

variable "location" {
  description = "The location name of the volume to create, not allowed if server_id argument is passed."
  type        = string
  default     = null
}

variable "automount" {
  description = "Automount the volume upon attaching it (server_id must be provided)."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.automount)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "format" {
  description = "Format volume after creation. xfs or ext4"
  type        = string
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
