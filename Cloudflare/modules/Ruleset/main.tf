resource "cloudflare_ruleset" "ruleset" {
  kind        = var.kind
  name        = var.name
  phase       = var.phase
  account_id  = var.account_id
  description = var.description
  rules       = var.rules
  zone_id     = var.zone_id
}