resource "acme_registration" "registration" {
  account_key_pem        = var.account_key_pem
  account_key_algorithm  = var.account_key_algorithm
  account_key_ecda_curve = var.account_key_ecdsa_curve
  account_key_rsa_bits   = var.account_key_rsa_bits
  email_address          = var.email_address

  dynamic "external_account_binding" {
    for_each = var.external_account_binding_block[*]
    content {
      hmac_base64 = external_account_binding.value.hmac_base64
      key_id      = external_account_binding.value.key_id
    }
  }
}