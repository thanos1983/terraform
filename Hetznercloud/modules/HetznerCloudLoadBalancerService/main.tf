resource "hcloud_load_balancer_service" "load_balancer_service" {
  load_balancer_id = var.load_balancer_id
  protocol         = var.protocol
  listen_port      = var.listen_port
  destination_port = var.destination_port
  proxyprotocol    = var.proxyprotocol

  dynamic "http" {
    for_each = var.http_block[*]
    content {
      sticky_sessions = http.value.sticky_sessions
      cookie_name     = http.value.cookie_name
      cookie_lifetime = http.value.cookie_lifetime
      certificates    = http.value.certificates
      redirect_http   = http.value.redirect_http
    }
  }

  dynamic "health_check" {
    for_each = var.health_check_block[*]
    content {
      protocol = health_check.value.protocol
      port     = health_check.value.port
      interval = health_check.value.interval
      timeout  = health_check.value.timeout
      retries  = health_check.value.retries
      dynamic "http" {
        for_each = health_check.value.http_block[*]
        content {
          domain       = http.value.domain
          path         = http.value.path
          response     = http.value.response
          tls          = http.value.tls
          status_codes = http.value.status_codes
        }
      }
    }
  }
}
