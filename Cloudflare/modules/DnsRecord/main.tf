resource "cloudflare_dns_record" "dns_record" {
  name     = var.name
  ttl      = var.ttl
  type     = var.type
  zone_id  = var.zone_id
  comment  = var.comment
  content  = var.content
  data     = var.data
  priority = var.priority
  proxied  = var.proxied
  settings = var.settings
  tags     = var.tags
}