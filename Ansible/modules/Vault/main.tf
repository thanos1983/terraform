resource "ansible_vault" "vault" {
  vault_file          = var.vault_file
  vault_password_file = var.vault_password_file
  vault_id            = var.vault_id
}
