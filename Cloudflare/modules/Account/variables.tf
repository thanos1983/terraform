variable "name" {
  description = "The name of the account that is displayed in the Cloudflare dashboard."
  type        = string
}

variable "enforce_twofactor" {
  description = "Whether 2FA is enforced on the account."
  type        = string
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enforce_twofactor)))
    error_message = "Parameter must be 'true' or 'false'."
  }
  default = false
}

variable "type" {
  description = "Account type."
  type        = string
  validation {
    condition     = contains(["enterprise", "standard"], lower(var.type))
    error_message = "Parameter must be 'enterprise' or 'standard'."
  }
  default = "standard"
}