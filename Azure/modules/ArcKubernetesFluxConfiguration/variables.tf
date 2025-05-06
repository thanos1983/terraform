variable "name" {
  description = "Specifies the name which should be used for this Arc Kubernetes Flux Configuration."
  type        = string
}

variable "cluster_id" {
  description = "Specifies the Cluster ID."
  type        = string
}

variable "kustomizations_block" {
  description = "A kustomizations block as defined below."
  type = object({
    name = string
    path = optional(string)
    timeout_in_seconds = optional(number, 600)
    sync_interval_in_seconds = optional(number, 600)
    retry_interval_in_seconds = optional(number, 600)
    recreating_enabled = optional(bool, false)
    garbage_collection_enabled = optional(bool, false)
    depends_on = optional(list(string), [])
  })
}

variable "namespace" {
  description = "Specifies the namespace to which this configuration is installed to."
  type        = string
}

variable "blob_storage_block" {
  description = "An blob_storage block as defined below."
  type = object({
    container_id = string
    account_key = optional(string)
    local_auth_reference = optional(string)
    sas_token = optional(string)
    service_principal_block = optional(object({
      client_id = string
      tenant_id = string
      client_certificate_base64 = optional(string)
      client_certificate_password = optional(string)
      client_certificate_send_chain = optional(bool)
      client_secret = optional(string)
    }), null)
    sync_interval_in_seconds = optional(number)
    timeout_in_seconds = optional(number)
  })
  default = null
}

variable "bucket_block" {
  description = "A bucket block as defined below."
  type = object({
    bucket_name              = string
    url                      = string
    access_key               = optional(string)
    secret_key_base64        = optional(string)
    tls_enabled              = optional(bool, true)
    local_auth_reference     = optional(string)
    sync_interval_in_seconds = optional(number, 600)
    timeout_in_seconds       = optional(number, 600)
  })
  default = null
}

variable "git_repository_block" {
  description = "A git_repository block as defined below."
  type = object({
    url                      = string
    reference_type           = string
    reference_value          = string
    https_ca_cert_base64     = optional(string)
    https_user               = optional(string)
    https_key_base64         = optional(string)
    local_auth_reference     = optional(string)
    ssh_private_key_base64   = optional(string)
    ssh_known_hosts_base64   = optional(string)
    sync_interval_in_seconds = optional(number, 600)
    timeout_in_seconds       = optional(number, 600)
  })
  default = null
}

variable "scope" {
  description = "Specifies the scope at which the operator will be installed."
  type        = string
  default     = null
}

variable "continuous_reconciliation_enabled" {
  description = "Whether the configuration will keep its reconciliation of its kustomizations and sources with the repository."
  type        = string
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 30)
    read = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}
