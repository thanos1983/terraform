resource "cloudflare_ruleset" "ruleset" {
  kind        = var.kind
  name        = var.name
  phase       = var.phase
  rules       = var.rules
  account_id  = var.account_id
  description = var.description
  zone_id     = var.zone_id
}