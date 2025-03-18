resource "cloudflare_api_token" "api_token" {
  name       = var.name
  policies   = var.policies
  condition  = var.condition
  expires_on = var.expires_on
  not_before = var.not_before
  status     = var.status
}