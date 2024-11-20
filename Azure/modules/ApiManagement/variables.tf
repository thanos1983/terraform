variable "name" {
  description = "The name of the API Management Service. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "The Azure location where the API Management Service exists. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the API Management Service should be exist."
  type        = string
}

variable "publisher_name" {
  description = "The name of publisher/company."
  type        = string
}

variable "publisher_email" {
  description = "The email of publisher/company."
  type        = string
}

variable "sku_name" {
  description = "sku_name is a string consisting of two parts separated by an underscore(_)."
  type        = string
}

variable "additional_location_blocks" {
  description = "One or more additional_location blocks as defined below."
  type = list(object({
    location = string
    capacity = optional(number)
    zones = optional(list(string))
    public_ip_address_id = optional(string)
    virtual_network_configuration_block = optional(object({
      subnet_id = string
    }), null)
    gateway_disabled = optional(bool)
  }))
  default = []
}

variable "certificate_blocks" {
  description = "One or more certificate blocks (up to 10) as defined below."
  type = list(object({
    encoded_certificate = string
    store_name          = string
    certificate_password = optional(string)
  }))
  default = []
}

variable "client_certificate_enabled" {
  description = "Enforce a client certificate to be presented on each request to the gateway?"
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.client_certificate_enabled)))
    error_message = "Parameter must be 'true' or 'false'."
  }
  default = false
}

variable "delegation_block" {
  description = "A delegation block as defined below."
  type = object({
    subscriptions_enabled = optional(bool)
    user_registration_enabled = optional(bool)
    url = optional(string)
    validation_key = optional(string)
  })
  default = null
}

variable "gateway_disabled" {
  description = "Disable the gateway in main region?"
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.gateway_disabled)))
    error_message = "Parameter must be 'true' or 'false'."
  }
  default = true
}

variable "min_api_version" {
  description = "The version which the control plane API calls to API Management service are limited with version equal to or newer than."
  type        = string
  default     = null
}

variable "zones" {
  description = "Specifies a list of Availability Zones in which this API Management service should be located."
  type = list(string)
  default     = null
}

variable "identity_block" {
  description = "An identity block as defined below."
  type = object({
    type = string
    identity_ids = optional(list(string))
  })
  default = {
    type = "SystemAssigned"
  }
}

variable "hostname_configuration_block" {
  description = "A hostname_configuration block as defined below."
  type = object({
    management_blocks = optional(list(object({
      host_name = string
      key_vault_id = optional(string)
      certificate = optional(string)
      certificate_password = optional(string)
      negotiate_client_certificate = optional(bool)
      ssl_keyvault_identity_client_id = optional(string)
    })), [])
    portal_blocks = optional(list(object({
      host_name = string
      key_vault_id = optional(string)
      certificate = optional(string)
      certificate_password = optional(string)
      negotiate_client_certificate = optional(bool)
      ssl_keyvault_identity_client_id = optional(string)
    })), [])
    developer_portal_blocks = optional(list(object({
      host_name = string
      key_vault_id = optional(string)
      certificate = optional(string)
      certificate_password = optional(string)
      negotiate_client_certificate = optional(bool)
      ssl_keyvault_identity_client_id = optional(string)
    })), [])
    proxy_blocks = optional(list(object({
      default_ssl_binding = optional(bool)
      host_name = string
      key_vault_id = optional(string)
      certificate = optional(string)
      certificate_password = optional(string)
      negotiate_client_certificate = optional(bool)
      ssl_keyvault_identity_client_id = optional(string)
    })), [])
    scm_blocks = optional(list(object({
      host_name = string
      key_vault_id = optional(string)
      certificate = optional(string)
      certificate_password = optional(string)
      negotiate_client_certificate = optional(bool)
      ssl_keyvault_identity_client_id = optional(string)
    })), [])
  })
  default = null
}

variable "notification_sender_email" {
  description = "Email address from which the notification will be sent."
  type        = string
  default     = null
}

variable "protocols_block" {
  description = "A protocols block as defined below."
  type = object({
    enable_http2 = optional(bool)
  })
  default = null
}

variable "security_block" {
  description = "A security block as defined below."
  type = object({
    enable_backend_ssl30 = optional(bool)
    enable_backend_tls10 = optional(bool)
    enable_backend_tls11 = optional(bool)
    enable_frontend_ssl30 = optional(bool)
    enable_frontend_tls10 = optional(bool)
    enable_frontend_tls11 = optional(bool)
    tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled = optional(bool)
    tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled = optional(bool)
    tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled = optional(bool)
    tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled = optional(bool)
    tls_rsa_with_aes128_cbc_sha256_ciphers_enabled = optional(bool)
    tls_rsa_with_aes128_cbc_sha_ciphers_enabled = optional(bool)
    tls_rsa_with_aes128_gcm_sha256_ciphers_enabled = optional(bool)
    tls_rsa_with_aes256_gcm_sha384_ciphers_enabled = optional(bool)
    tls_rsa_with_aes256_cbc_sha256_ciphers_enabled = optional(bool)
    tls_rsa_with_aes256_cbc_sha_ciphers_enabled = optional(bool)
    triple_des_ciphers_enabled = optional(bool)
  })
  default = null
}

variable "sign_in_block" {
  description = "A sign_in block as defined below."
  type = object({
    enabled = bool
  })
  default = null
}

variable "sign_up_block" {
  description = "A sign_up block as defined below."
  type = object({
    enabled = bool
    terms_of_service_block = optional(object({
      consent_required = bool
      enabled          = bool
      text = optional(string)
    }), null)
  })
  default = null
}

variable "tenant_access_block" {
  description = "A tenant_access block as defined below."
  type = object({
    enabled = bool
  })
  default = null
}

variable "public_ip_address_id" {
  description = "ID of a standard SKU IPv4 Public IP."
  type        = string
  default     = null
}

variable "public_network_access_enabled" {
  description = "Is public access to the service allowed?"
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.public_network_access_enabled)))
    error_message = "Parameter must be 'true' or 'false'."
  }
  default = true
}

variable "virtual_network_type" {
  description = "The type of virtual network you want to use, valid values include: None, External, Internal."
  type        = string
  validation {
    condition = contains(["None", "External", "Internal"], title(var.virtual_network_type))
    error_message = "Parameter must be 'None', 'External' or 'Internal'."
  }
  default = "None"
}

variable "virtual_network_configuration_block" {
  description = "A virtual_network_configuration block as defined below."
  type = object({
    subnet_id = string
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the API Connection."
  type = map(string)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number)
    read = optional(number)
    update = optional(number)
    delete = optional(number)
  })
  default = null
}