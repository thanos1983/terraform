resource "cloudflare_account" "account" {
  name     = var.name
  type     = var.type
  settings = var.settings
  unit     = var.unit
}
