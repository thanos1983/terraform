resource "kubernetes_cluster_role_v1" "cluster_role" {
  dynamic "metadata" {
    for_each = var.metadata_block[*]
    content {
      annotations   = metadata.value.annotations
      generate_name = metadata.value.generate_name
      labels        = metadata.value.labels
      name          = metadata.value.name
    }
  }

  dynamic "rule" {
    for_each = var.rule_blocks
    content {
      api_groups        = rule.value.api_groups
      non_resource_urls = rule.value.non_resource_urls
      resource_names    = rule.value.resource_names
      resources         = rule.value.resources
      verbs             = rule.value.verbs
    }
  }

  dynamic "aggregation_rule" {
    for_each = var.aggregation_rule_block[*]
    content {
      dynamic "cluster_role_selectors" {
        for_each = aggregation_rule.value.cluster_role_selectors_blocks
        content {
          match_labels = cluster_role_selectors.value.match_labels
          dynamic "match_expressions" {
            for_each = cluster_role_selectors.value.match_expressions_blocks
            content {
              key      = match_expressions.value.key
              operator = match_expressions.value.operator
              values   = match_expressions.value.values
            }
          }
        }
      }
    }
  }
}