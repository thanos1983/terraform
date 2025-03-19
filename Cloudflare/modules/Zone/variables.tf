variable "account" {
  description = "Account ID to manage the zone resource in."
  type = object({
    id = optional(string)
  })
}

variable "name" {
  description = "The domain name."
  type        = string
}

variable "type" {
  description = "A full zone implies that DNS is hosted with Cloudflare."
  type        = bool
  validation {
    condition = contains(["full", "partial", "secondary"], lower(var.type))
    error_message = "Parameter must be 'full', 'partial' or 'secondary'."
  }
  default = "full"
}

variable "vanity_name_servers" {
  description = "An array of domains used for custom name servers."
  type = list(string)
  default = []
}
