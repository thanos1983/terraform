variable "name" {
  description = "DNS record name (or @ for the zone apex) in Punycode."
  type        = string
}

variable "ttl" {
  description = "Time To Live (TTL) of the DNS record in seconds."
  type        = number
}

variable "type" {
  description = "Record type."
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
  description = "A valid IPv4 address."
  type        = string
  default     = null
}

variable "data" {
  description = "Components of a CAA record."
  type = object({
    algorithm = optional(number)
    altitude = optional(number)
    certificate = optional(string)
    digest = optional(string)
    digest_type = optional(number)
    fingerprint = optional(string)
    flags = optional(number)
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
  description = "Required for MX, SRV and URI records; unused by other record types."
  type        = string
  default     = null
}

variable "proxied" {
  description = "Whether the record is receiving the performance and security benefits of Cloudflare."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.proxied)))
    error_message = "Parameter must be 'true' or 'false'."
  }
  default = false
}

variable "settings" {
  description = "Settings for the DNS record."
  type = object({
    flatten_cname = optional(bool)
    ipv4_only = optional(bool)
    ipv6_only = optional(bool)
  })
  default = null
}

variable "tags" {
  description = "Custom tags for the DNS record."
  type = list(string)
  default = []
}
