resource "cloudflare_dns_record" "dns_record" {
  name            = var.name
  ttl             = var.ttl
  type            = var.type
  comment         = var.comment
  content         = var.content
  data            = var.data
  priority        = var.priority
  private_routing = var.private_routing
  proxied         = var.proxied
  settings        = var.settings
  tags            = var.tags
  zone_id         = var.zone_id
}