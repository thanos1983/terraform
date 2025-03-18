resource "cloudflare_api_token" "api_token" {
  name = var.name

  dynamic "policies" {
    for_each = var.policies_blocks
    content {
      effect = policies.value.effect
      dynamic "permission_groups" {
        for_each = policies.value.permission_groups_blocks
        content {
          id = permission_groups.value.id
          dynamic "meta" {
            for_each = permission_groups.value.meta_block[*]
            content {
              key   = meta.value.key
              value = meta.value.value
            }
          }
        }
      }
      resources = policies.value.resources
    }
  }

  dynamic "condition" {
    for_each = var.condition_block[*]
    content {
      dynamic "request_ip" {
        for_each = condition.value.request_ip_block
        content {
          in     = request_ip.value.in
          not_in = request_ip.value.not_in
        }
      }
    }
  }

  expires_on = var.expires_on
  not_before = var.not_before
  status     = var.status
}