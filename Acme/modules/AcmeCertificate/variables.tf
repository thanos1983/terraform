variable "account_key_pem" {
  description = "The private key used to identify the account."
  type        = string
}

variable "common_name" {
  description = "The certificate's common name, the primary domain that the certificate will be recognized for."
  type        = string
  default     = null
}

variable "subject_alternative_names" {
  description = "The certificate's subject alternative names, domains that this certificate will also be recognized for."
  type = list(string)
  default     = null
}

variable "key_type" {
  description = "The key type for the certificate's private key."
  type        = string
  validation {
    condition = contains(["2048", "4096", "8192"], tostring(var.key_type))
    error_message = "Possible values can be \"2048\", \"4096\" or \"8192\"."
  }
  default = "2048"
}

variable "dns_challenge_blocks" {
  description = "The DNS challenges to use in fulfilling the request."
  type = list(object({
    provider = string
    config = optional(map(string))
  }))
  default = []
}

variable "recursive_nameservers" {
  description = "The recursive nameservers that will be used to check for propagation of DNS challenge records, in addition to some in-provider checks such as zone detection."
  type = list(string)
  default     = null
}

variable "disable_complete_propagation" {
  description = "Disable the requirement for full propagation of the TXT challenge records before proceeding with validation."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.disable_complete_propagation)))
    error_message = "Possible values can be \"true\" or \"false\"."
  }
  default = false
}

variable "pre_check_delay" {
  description = "Insert a delay after every DNS challenge record to allow for extra time for DNS propagation before the certificate is requested."
  type        = string
  default     = null
}

variable "http_challenge_block" {
  description = "Defines an HTTP challenge to use in fulfilling the request."
  type = object({
    port = optional(string)
    proxy_header = optional(string)
  })
  default = null
}

variable "http_webroot_challenge_block" {
  description = "Defines an alternate type of HTTP challenge that can be used to place a file at a location that can be served by an out-of-band webserver."
  type = object({
    directory = string
  })
  default = null
}

variable "http_memcached_challenge_block" {
  description = "Defines an alternate type of HTTP challenge that can be used to serve up challenges to a Memcached cluster."
  type = object({
    hosts = list(string)
  })
  default = null
}

variable "http_s3_challenge_block" {
  description = "Defines an alternate type of HTTP challenge that can be used to serve up challenges to a S3 bucket."
  type = object({
    s3_bucket = string
  })
  default = null
}

variable "tls_challenge_block" {
  description = "Defines a TLS challenge to use in fulfilling the request."
  type = object({
    port = optional(number, 443)
  })
  default = null
}

variable "must_staple" {
  description = "Enables the OCSP Stapling Required TLS Security Policy extension."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.must_staple)))
    error_message = "Possible values can be \"true\" or \"false\"."
  }
  default = false
}

variable "min_days_remaining" {
  description = "The minimum amount of days remaining on the expiration of a certificate before a renewal is attempted."
  type        = number
  default     = 30
}

variable "certificate_p12_password" {
  description = "Password to be used when generating the PFX file stored in certificate_p12."
  type        = string
  default     = null
}

variable "preferred_chain" {
  description = "The common name of the root of a preferred alternate certificate chain offered by the CA."
  type        = string
  default     = null
}

variable "revoke_certificate_on_destroy" {
  description = "Enables revocation of a certificate upon destroy, which includes when a resource is re-created."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.revoke_certificate_on_destroy)))
    error_message = "Possible values can be \"true\" or \"false\"."
  }
  default = true
}

variable "revoke_certificate_reason" {
  description = "Some CA's require a reason for revocation to be provided."
  type        = string
  default     = null
}

variable "cert_timeout" {
  description = "Controls the timeout in seconds for certificate requests that are made after challenges are complete."
  type        = number
  default     = 30
}