resource "cloudflare_account" "account" {
  name              = var.name
  type              = var.type
  enforce_twofactor = var.enforce_twofactor
}