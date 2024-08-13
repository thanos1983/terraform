resource "acme_certificate" "certificate" {
  account_key_pem           = var.account_key_pem
  common_name               = var.common_name
  subject_alternative_names = var.subject_alternative_names
  key_type                  = var.key_type

  dynamic "dns_challenge" {
    for_each = var.dns_challenge_blocks
    content {
      provider = dns_challenge.value.provider
      config   = dns_challenge.value.config
    }
  }

  recursive_nameservers        = var.recursive_nameservers
  disable_complete_propagation = var.disable_complete_propagation
  pre_check_delay              = var.pre_check_delay

  dynamic "http_challenge" {
    for_each = var.http_challenge_block[*]
    content {
      port         = http_challenge.value.port
      proxy_header = http_challenge.value.proxy_header
    }
  }

  dynamic "http_webroot_challenge" {
    for_each = var.http_webroot_challenge_block[*]
    content {
      directory = http_webroot_challenge.value.directory
    }
  }

  dynamic "http_memcached_challenge" {
    for_each = var.http_memcached_challenge_block[*]
    content {
      hosts = http_memcached_challenge.value.hosts
    }
  }

  dynamic "http_s3_challenge" {
    for_each = var.http_s3_challenge_block[*]
    content {
      s3_bucket = http_s3_challenge.value.s3_bucket
    }
  }

  dynamic "tls_challenge" {
    for_each = var.tls_challenge_block[*]
    content {
      port = tls_challenge.value.port
    }
  }

  must_staple                   = var.must_staple
  min_days_remaining            = var.min_days_remaining
  certificate_p12_password      = var.certificate_p12_password
  preferred_chain               = var.preferred_chain
  revoke_certificate_on_destroy = var.revoke_certificate_on_destroy
  revoke_certificate_reason     = var.revoke_certificate_reason
  cert_timeout                  = var.cert_timeout
}