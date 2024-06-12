resource "cloudflare_api_token" "api_token" {
  name = var.name

  dynamic "policy" {
    for_each = var.policy_blocks
    content {
      permission_groups = policy.value.permission_groups
      resources         = policy.value.resources
      effect            = policy.value.effect
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
}