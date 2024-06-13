variable "zone_id" {
  description = "The zone identifier to target for the resource."
  type        = string
}

variable "settings_block" {
  description = "Settings block"
  type        = object({
    always_online             = optional(string)
    always_use_https          = optional(string)
    automatic_https_rewrites  = optional(string)
    binary_ast                = optional(string)
    brotli                    = optional(string)
    browser_cache_ttl         = optional(number)
    browser_check             = optional(string)
    cache_level               = optional(string)
    challenge_ttl             = optional(number)
    ciphers                   = optional(list(string))
    cname_flattening          = optional(string)
    development_mode          = optional(string)
    early_hints               = optional(string)
    email_obfuscation         = optional(string)
    filter_logs_to_cloudflare = optional(string)
    fonts                     = optional(string)
    h2_prioritization         = optional(string)
    hotlink_protection        = optional(string)
    http2                     = optional(string)
    http3                     = optional(string)
    image_resizing            = optional(string)
    ip_geolocation            = optional(string)
    ipv6                      = optional(string)
    log_to_cloudflare         = optional(string)
    max_upload                = optional(number)
    min_tls_version           = optional(string)
    minify_block              = optional(object({
      css  = string
      html = string
      js   = string
    }), null)
    mirage                = optional(string)
    mobile_redirect_block = optional(object({
      mobile_subdomain = string
      status           = string
      strip_uri        = bool
    }), null)
    nel_block = optional(object({
      enabled = bool
    }), null)
    opportunistic_encryption    = optional(string)
    opportunistic_onion         = optional(string)
    orange_to_orange            = optional(string)
    origin_error_page_pass_thru = optional(string)
    origin_max_http_version     = optional(string)
    polish                      = optional(string)
    prefetch_preload            = optional(string)
    privacy_pass                = optional(string)
    proxy_read_timeout          = optional(string)
    pseudo_ipv4                 = optional(string)
    response_buffering          = optional(string)
    rocket_loader               = optional(string)
    security_header_block       = optional(object({
      enabled            = bool
      include_subdomains = bool
      max_age            = number
      nosniff            = bool
      preload            = bool
    }), null)
    security_level              = optional(string)
    server_side_exclude         = optional(string)
    sort_query_string_for_cache = optional(string)
    ssl                         = optional(string)
    tls_1_3                     = optional(string)
    tls_client_auth             = optional(string)
    true_client_ip_header       = optional(string)
    universal_ssl               = optional(string)
    visitor_ip                  = optional(string)
    waf                         = optional(string)
    webp                        = optional(string)
    websockets                  = optional(string)
    zero_rtt                    = optional(string)
  })
  default = null
}