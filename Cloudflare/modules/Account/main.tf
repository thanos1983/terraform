resource "cloudflare_account" "account" {
  name       = var.name
  managed_by = var.managed_by
  settings   = var.settings
  unit       = var.unit
}
