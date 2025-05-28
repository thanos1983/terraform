resource "helm_release" "release" {
  chart                      = var.chart
  name                       = var.name
  atomic                     = var.atomic
  cleanup_on_fail            = var.cleanup_on_fail
  create_namespace           = var.create_namespace
  dependency_update          = var.dependency_update
  description                = var.description
  devel                      = var.devel
  disable_crd_hooks          = var.disable_crd_hooks
  disable_openapi_validation = var.disable_openapi_validation
  disable_webhooks           = var.disable_webhooks
  force_update               = var.force_update
  keyring                    = var.keyring
  lint                       = var.lint
  max_history                = var.max_history
  namespace                  = var.namespace
  pass_credentials           = var.pass_credentials

  dynamic "postrender" {
    for_each = var.postrender_block[*]
    content {
      binary_path = postrender.value.binary_path
      args        = postrender.value.args
    }
  }

  recreate_pods         = var.recreate_pods
  render_subchart_notes = var.render_subchart_notes
  replace               = var.replace
  repository            = var.repository
  repository_ca_file    = var.repository_ca_file
  repository_cert_file  = var.repository_cert_file
  repository_key_file   = var.repository_key_file
  repository_password   = var.repository_password
  repository_username   = var.repository_username
  reset_values          = var.reset_values
  reuse_values          = var.reuse_values

  dynamic "set" {
    for_each = var.set_blocks
    content {
      name  = set.value.name
      value = set.value.value
      type  = set.value.type
    }
  }

  dynamic "set_wo" {
    for_each = var.set_wo_blocks
    content {
      name  = set_wo.value.name
      value = set_wo.value.value
      type  = set_wo.value.type
    }
  }

  set_wo_revision = var.set_wo_revision

  dynamic "set_list" {
    for_each = var.set_list_blocks
    content {
      name  = set_list.value.name
      value = set_list.value.value
    }
  }

  dynamic "set_sensitive" {
    for_each = var.set_sensitive_blocks
    content {
      name  = set_sensitive.value.name
      value = set_sensitive.value.value
      type  = set_sensitive.value.type
    }
  }

  skip_crds       = var.skip_crds
  timeout         = var.timeout
  upgrade_install = var.upgrade_install
  values          = var.values
  verify          = var.verify
  version         = var.helm_version
  wait            = var.wait
  wait_for_jobs   = var.wait_for_jobs
}
