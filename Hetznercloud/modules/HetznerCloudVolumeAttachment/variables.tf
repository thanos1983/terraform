variable "volume_id" {
  description = "ID of the Volume."
  type        = string
}

variable "server_id" {
  description = "Server to attach the Volume to."
  type        = string
}

variable "automount" {
  description = "Automount the volume upon attaching it."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.automount)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}
