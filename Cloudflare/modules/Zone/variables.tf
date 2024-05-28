variable "account_id" {
  description = "Account ID to manage the zone resource in."
  type        = string
}

variable "zone" {
  description = "The DNS zone name which will be added."
  type        = string
}

variable "jump_start" {
  description = "Whether to scan for DNS records on creation."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.jump_start)))
    error_message = "Parameter must be 'true' or 'false'."
  }
  default = false
}

variable "paused" {
  description = "Whether this zone is paused (traffic bypasses Cloudflare)."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.paused)))
    error_message = "Parameter must be 'true' or 'false'."
  }
  default = false
}

variable "plan" {
  description = "The name of the commercial plan to apply to the zone."
  type        = bool
  validation {
    condition = contains([
      "free", "lite", "pro", "pro_plus", "business", "enterprise", "partners_free", "partners_pro", "partners_business",
      "partners_enterprise"
    ], lower(var.plan))
    error_message = "Parameter must be 'free', 'lite', 'pro', 'pro_plus', 'business', 'enterprise', 'partners_free', 'partners_pro', 'partners_business' or 'partners_enterprise'."
  }
  default = "free"
}

variable "type" {
  description = "A full zone implies that DNS is hosted with Cloudflare."
  type        = bool
  validation {
    condition     = contains(["full", "partial", "secondary"], lower(var.type))
    error_message = "Parameter must be 'full', 'partial' or 'secondary'."
  }
  default = "full"
}