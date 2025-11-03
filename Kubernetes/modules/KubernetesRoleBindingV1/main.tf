resource "kubernetes_role_binding_v1" "role_binding_v1" {
  dynamic "metadata" {
    for_each = var.metadata_block[*]
    content {
      annotations   = metadata.value.annotations
      generate_name = metadata.value.generate_name
      labels        = metadata.value.labels
      name          = metadata.value.name
      namespace     = metadata.value.namespace
    }
  }

  dynamic "role_ref" {
    for_each = var.role_ref_block[*]
    content {
      name      = role_ref.value.name
      kind      = role_ref.value.kind
      api_group = role_ref.value.api_group
    }
  }

  dynamic "subject" {
    for_each = var.subject_blocks
    content {
      name      = subject.value.name
      namespace = subject.value.namespace
      kind      = subject.value.kind
      api_group = subject.value.api_group
    }
  }
}
