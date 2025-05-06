resource "azurerm_arc_kubernetes_flux_configuration" "arc_kubernetes_flux_configuration" {
  name       = var.name
  cluster_id = var.cluster_id

  dynamic "kustomizations" {
    for_each = var.kustomizations_block[*]
    content {
      name                       = kustomizations.value.name
      path                       = kustomizations.value.path
      timeout_in_seconds         = kustomizations.value.timeout_in_seconds
      sync_interval_in_seconds   = kustomizations.value.sync_interval_in_seconds
      retry_interval_in_seconds  = kustomizations.value.retry_interval_in_seconds
      recreating_enabled         = kustomizations.value.recreating_enabled
      garbage_collection_enabled = kustomizations.value.garbage_collection_enabled
      depends_on                 = kustomizations.value.depends_on
    }
  }

  namespace = var.namespace

  dynamic "blob_storage" {
    for_each = var.blob_storage_block[*]
    content {
      container_id         = blob_storage.value.container_id
      account_key          = blob_storage.value.account_key
      local_auth_reference = blob_storage.value.local_auth_reference
      sas_token            = blob_storage.value.sas_token
      dynamic "service_principal" {
        for_each = blob_storage.value.service_principal_block[*]
        content {
          client_id                     = service_principal.value.client_id
          tenant_id                     = service_principal.value.tenant_id
          client_certificate_base64     = service_principal.value.client_certificate_base64
          client_certificate_password   = service_principal.value.client_certificate_password
          client_certificate_send_chain = service_principal.value.client_certificate_send_chain
          client_secret                 = service_principal.value.client_secret
        }
      }
      sync_interval_in_seconds = blob_storage.value.sync_interval_in_seconds
      timeout_in_seconds       = blob_storage.value.timeout_in_seconds
    }
  }

  dynamic "bucket" {
    for_each = var.bucket_block[*]
    content {
      bucket_name              = bucket.value.bucket_name
      url                      = bucket.value.url
      access_key               = bucket.value.access_key
      secret_key_base64        = bucket.value.secret_key_base64
      tls_enabled              = bucket.value.tls_enabled
      local_auth_reference     = bucket.value.local_auth_reference
      sync_interval_in_seconds = bucket.value.sync_interval_in_seconds
      timeout_in_seconds       = bucket.value.timeout_in_seconds
    }
  }

  dynamic "git_repository" {
    for_each = var.git_repository_block[*]
    content {
      url                      = git_repository.value.url
      reference_type           = git_repository.value.reference_type
      reference_value          = git_repository.value.reference_value
      https_ca_cert_base64     = git_repository.value.https_ca_cert_base64
      https_user               = git_repository.value.https_user
      https_key_base64         = git_repository.value.https_key_base64
      local_auth_reference     = git_repository.value.local_auth_reference
      ssh_private_key_base64   = git_repository.value.ssh_private_key_base64
      ssh_known_hosts_base64   = git_repository.value.ssh_known_hosts_base64
      sync_interval_in_seconds = git_repository.value.sync_interval_in_seconds
      timeout_in_seconds       = git_repository.value.timeout_in_seconds
    }
  }

  scope                             = var.scope
  continuous_reconciliation_enabled = var.continuous_reconciliation_enabled

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}
