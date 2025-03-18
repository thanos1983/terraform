resource "cloudflare_zone" "zone" {
  dynamic "account" {
    for_each = var.account_block[*]
    content {
      id = account.value.id
    }
  }

  name                = var.name
  type                = var.type
  vanity_name_servers = var.vanity_name_servers
}