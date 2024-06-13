resource "cloudflare_zone_settings_override" "zone_settings_override" {
  zone_id = var.zone_id

  dynamic "settings" {
    for_each = var.settings_block[*]
    content {
      always_online             = settings.value.always_online
      always_use_https          = settings.value.always_online
      automatic_https_rewrites  = settings.value.always_online
      binary_ast                = settings.value.always_online
      brotli                    = settings.value.always_online
      browser_cache_ttl         = number
      browser_check             = settings.value.always_online
      cache_level               = settings.value.always_online
      challenge_ttl             = number
      ciphers                   = list(string)
      cname_flattening          = settings.value.always_online
      development_mode          = settings.value.development_mode
      early_hints               = settings.value.early_hints
      email_obfuscation         = settings.value.email_obfuscation
      filter_logs_to_cloudflare = settings.value.filter_logs_to_cloudflare
      fonts                     = settings.value.fonts
      h2_prioritization         = settings.value.h2_prioritization
      hotlink_protection        = settings.value.hotlink_protection
      http2                     = settings.value.http2
      http3                     = settings.value.http3
      image_resizing            = settings.value.image_resizing
      ip_geolocation            = settings.value.ip_geolocation
      ipv6                      = settings.value.ipv6
      log_to_cloudflare         = settings.value.log_to_cloudflare
      max_upload                = settings.value.max_upload
      min_tls_version           = settings.value.min_tls_version

      dynamic "minify" {
        for_each = settings.value.minify_block
        content {
          css  = minify.value.css
          html = minify.value.html
          js   = minify.value.js
        }
      }

      mirage = settings.value.mirage

      dynamic "mobile_redirect" {
        for_each = settings.value.mobile_redirect_block
        content {
          mobile_subdomain = mobile_redirect.value.mobile_subdomain
          status           = mobile_redirect.value.status
          strip_uri        = mobile_redirect.value.strip_uri
        }
      }

      dynamic "nel" {
        for_each = settings.value.nel_block
        content {
          enabled = nel.value.enabled
        }
      }

      opportunistic_encryption    = settings.value.opportunistic_encryption
      opportunistic_onion         = settings.value.opportunistic_onion
      orange_to_orange            = settings.value.orange_to_orange
      origin_error_page_pass_thru = settings.value.origin_error_page_pass_thru
      origin_max_http_version     = settings.value.origin_max_http_version
      polish                      = settings.value.polish
      prefetch_preload            = settings.value.prefetch_preload
      privacy_pass                = settings.value.privacy_pass
      proxy_read_timeout          = settings.value.proxy_read_timeout
      pseudo_ipv4                 = settings.value.pseudo_ipv4
      response_buffering          = settings.value.response_buffering
      rocket_loader               = settings.value.rocket_loader

      dynamic "security_header" {
        for_each = settings.value.security_header_block
        content {
          enabled            = security_header.value.enabled
          include_subdomains = security_header.value.include_subdomains
          max_age            = security_header.value.max_age
          nosniff            = security_header.value.nosniff
          preload            = security_header.value.preload
        }
      }

      security_level              = settings.value.security_level
      server_side_exclude         = settings.value.server_side_exclude
      sort_query_string_for_cache = settings.value.sort_query_string_for_cache
      ssl                         = settings.value.ssl
      tls_1_3                     = settings.value.tls_1_3
      tls_client_auth             = settings.value.tls_client_auth
      true_client_ip_header       = settings.value.true_client_ip_header
      universal_ssl               = settings.value.universal_ssl
      visitor_ip                  = settings.value.visitor_ip
      waf                         = settings.value.waf
      webp                        = settings.value.webp
      websockets                  = settings.value.websockets
      zero_rtt                    = settings.value.zero_rtt
    }
  }
}