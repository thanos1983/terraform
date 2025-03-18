variable "name" {
  description = "The name of the record."
  type        = string
}

variable "ttl" {
  description = "The TTL of the record."
  type        = number
}

variable "type" {
  description = "The type of the record."
  type        = string
}

variable "zone_id" {
  description = "The zone identifier to target for the resource."
  type        = string
}

variable "comment" {
  description = "Comments or notes about the DNS record."
  type        = string
  default     = null
}

variable "content" {
  description = "The content of the record."
  type        = string
  default     = null
}

variable "data_block" {
  description = "Map of attributes that constitute the record value."
  type = object({
    algorithm = optional(number)
    altitude = optional(number)
    certificate = optional(string)
    digest = optional(string)
    digest_type = optional(number)
    fingerprint = optional(string)
    flags = optional(string)
    key_tag = optional(number)
    lat_degrees = optional(number)
    lat_direction = optional(string)
    lat_minutes = optional(number)
    lat_seconds = optional(number)
    long_degrees = optional(number)
    long_direction = optional(string)
    long_minutes = optional(number)
    long_seconds = optional(number)
    matching_type = optional(number)
    order = optional(number)
    port = optional(number)
    precision_horz = optional(number)
    precision_vert = optional(number)
    preference = optional(number)
    priority = optional(number)
    protocol = optional(number)
    public_key = optional(string)
    regex = optional(string)
    replacement = optional(string)
    selector = optional(number)
    service = optional(string)
    size = optional(number)
    tag = optional(string)
    target = optional(string)
    type = optional(number)
    usage = optional(number)
    value = optional(string)
    weight = optional(number)
  })
  default = null
}

variable "priority" {
  description = "The priority of the record."
  type        = string
  default     = null
}

variable "proxied" {
  description = "Whether the record gets Cloudflare's origin protection."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.proxied)))
    error_message = "Parameter must be 'true' or 'false'."
  }
  default = false
}

variable "settings_block" {
  description = "Settings for the DNS record."
  type = object({
    flatten_cname = optional(bool)
    ipv4_only     = optional(bool)
    ipv6_only     = optional(bool)
  })
  default = null
}

variable "tags" {
  description = "Custom tags for the DNS record."
  type = set(string)
  default     = null
}
