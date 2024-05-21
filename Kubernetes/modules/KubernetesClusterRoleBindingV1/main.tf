resource "kubernetes_cluster_role_binding_v1" "cluster_role_binding_v1" {
  dynamic "metadata" {
    for_each = var.metadata_block[*]
    content {
      annotations   = metadata.value.annotations
      generate_name = metadata.value.generate_name
      labels        = metadata.value.labels
      name          = metadata.value.name
    }
  }

  dynamic "role_ref" {
    for_each = var.role_ref_block
    content {
      api_group = role_ref.value.api_group
      kind      = role_ref.value.kind
      name      = role_ref.value.name
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