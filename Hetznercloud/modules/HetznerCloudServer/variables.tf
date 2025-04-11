variable "name" {
  description = "Name of the server to create (must be unique per project and a valid hostname as per RFC 1123)."
  type        = string
}

variable "server_type" {
  description = "Name of the server type this server should be created with."
  type        = string
}

variable "image" {
  description = "Name or ID of the image the server is created from."
  type        = string
}

variable "location" {
  description = "The location name to create the server in."
  type        = string
  default     = "hel1"
}

variable "datacenter" {
  description = "The datacenter name to create the server in."
  type        = string
  default     = "hel1-dc2"
}

variable "user_data" {
  description = "Cloud-Init user data to use during server creation."
  type        = string
  default     = null
}

variable "ssh_keys" {
  description = "SSH key IDs or names which should be injected into the server at creation time."
  type = list(string)
  default = []
}

variable "public_net_block" {
  description = "In this block you can either enable / disable ipv4 and ipv6 or link existing primary IPs (checkout the examples)."
  type = object({
    ipv4_enabled = optional(bool)
    ipv4 = optional(string)
    ipv6_enabled = optional(bool)
    ipv6 = optional(string)
  })
  default = null
}

variable "keep_disk" {
  description = "If true, do not upgrade the disk."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.keep_disk)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "iso" {
  description = "ID or Name of an ISO image to mount."
  type        = string
  default     = null
}

variable "rescue" {
  description = "Enable and boot in to the specified rescue system."
  type        = string
  default     = null
}

variable "labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type = map(any)
  default     = null
}

variable "backups" {
  description = "Enable or disable backups."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.backups)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "firewall_ids" {
  description = "Firewall IDs the server should be attached to on creation."
  type = list(string)
  default = []
}

variable "ignore_remote_firewall_ids" {
  description = "Ignores any updates to the firewall_ids argument which were received from the server."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.ignore_remote_firewall_ids)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "network_blocks" {
  description = "Network the server should be attached to on creation."
  type = list(object({
    network_id = number
    ip = optional(string)
    alias_ips = optional(list(string))
  }))
  default = []
}

variable "placement_group_id" {
  description = "Placement Group ID the server added to on creation."
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

variable "rebuild_protection" {
  description = "Enable or disable rebuild protection (Needs to be the same as delete_protection)"
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.rebuild_protection)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "allow_deprecated_images" {
  description = "Enable the use of deprecated images."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.allow_deprecated_images)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "shutdown_before_deletion" {
  description = "Whether to try shutting the server down gracefully before deleting it."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.shutdown_before_deletion)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}
