resource "helm_release" "release" {
  name                 = var.name
  chart                = var.chart
  repository           = var.repository
  repository_key_file  = var.repository_key_file
  repository_cert_file = var.repository_cert_file
  repository_ca_file   = var.repository_ca_file
  repository_username  = var.repository_username
  repository_password  = var.repository_password
  devel                = var.devel
  version              = var.helm_version
  namespace            = var.namespace
  verify               = var.verify
  keyring              = var.keyring
  timeout              = var.timeout
  disable_webhooks     = var.disable_webhooks
  reuse_values         = var.reuse_values
  reset_values         = var.reset_values
  force_update         = var.force_update
  recreate_pods        = var.recreate_pods
  cleanup_on_fail      = var.cleanup_on_fail
  max_history          = var.max_history
}