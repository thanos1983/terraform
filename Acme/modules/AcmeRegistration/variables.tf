variable "account_key_pem" {
  description = "The private key used to identify the account."
  type        = string
  default     = null
}

variable "account_key_algorithm" {
  description = "The algorithm to use for the private key when generating from scratch."
  type        = string
  validation {
    condition = contains(["RSA", "ECDSA"], upper(var.account_key_algorithm))
    error_message = "Possible values can be \"RSA\" or \"ECDSA\"."
  }
  default = "ECDSA"
}

variable "account_key_ecdsa_curve" {
  description = "ECDSA curve to use for ECDSA key types."
  type        = string
  validation {
    condition = contains(["P256", "P384"], upper(var.account_key_ecdsa_curve))
    error_message = "Possible values can be \"P256\" or \"P384\"."
  }
  default = "P384"
}

variable "account_key_rsa_bits" {
  description = "The key length to use for RSA key types."
  type        = string
  validation {
    condition = contains(["2048", "3072", "4096"], tostring(var.account_key_rsa_bits))
    error_message = "Possible values can be \"2048\", \"3072\" or \"4096\"."
  }
  default = "4096"
}

variable "email_address" {
  description = "The contact email address for the account."
  type        = string
}

variable "external_account_binding_block" {
  description = "An external account binding for the registration, usually used to link the registration with an account in a commercial CA."
  type = object({
    key_id      = string
    hmac_base64 = string
  })
  default = null
}