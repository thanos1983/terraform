resource "kubernetes_role_v1" "role_v1" {
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

  dynamic "rule" {
    for_each = var.rule_blocks
    content {
      api_groups     = rule.value.api_groups
      resources      = rule.value.resources
      resource_names = rule.value.resource_names
      verbs          = rule.value.verbs
    }
  }

  dynamic "aggregation_rule" {
    for_each = var.aggregation_rule_block[*]
    content {
      dynamic "cluster_role_selectors" {
        for_each = aggregation_rule.value.cluster_role_selectors_blocks
        content {
          match_expressions = cluster_role_selectors.value.match_expressions
          match_labels      = cluster_role_selectors.value.match_labels
        }
      }
    }
  }
}