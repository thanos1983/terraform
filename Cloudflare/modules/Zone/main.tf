resource "cloudflare_zone" "zone" {
  account             = var.account
  name                = var.name
  paused              = var.paused
  type                = var.type
  vanity_name_servers = var.vanity_name_servers
}