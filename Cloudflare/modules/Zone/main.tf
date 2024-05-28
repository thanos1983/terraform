resource "cloudflare_zone" "zone" {
  account_id = var.account_id
  zone       = var.zone
  jump_start = var.jump_start
  paused     = var.paused
  plan       = var.plan
  type       = var.type
}