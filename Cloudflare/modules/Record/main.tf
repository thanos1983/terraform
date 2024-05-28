resource "cloudflare_record" "record" {
  name            = var.name
  type            = var.type
  zone_id         = var.zone_id
  allow_overwrite = var.allow_overwrite
  comment         = var.comment

  dynamic "data" {
    for_each = var.data_block[*]
    content {
      algorithm      = data.value.algorithm
      altitude       = data.value.altitude
      certificate    = data.value.certificate
      content        = data.value.content
      digest         = data.value.digest
      digest_type    = data.value.digest_type
      fingerprint    = data.value.fingerprint
      flags          = data.value.flags
      key_tag        = data.value.key_tag
      lat_degrees    = data.value.lat_degrees
      lat_direction  = data.value.lat_direction
      lat_minutes    = data.value.lat_minutes
      lat_seconds    = data.value.lat_seconds
      long_degrees   = data.value.long_degrees
      long_direction = data.value.long_direction
      long_minutes   = data.value.long_minutes
      long_seconds   = data.value.long_secondsm
      matching_type  = data.value.matching_type
      name           = data.value.name
      order          = data.value.order
      port           = data.value.port
      precision_horz = data.value.precision_horz
      precision_vert = data.value.precision_vert
      preference     = data.value.preference
      priority       = data.value.priority
      proto          = data.value.proto
      protocol       = data.value.protocol
      public_key     = data.value.public_key
      regex          = data.value.regex
      replacement    = data.value.replacement
      selector       = data.value.selector
      service        = data.value.service
      size           = data.value.size
      tag            = data.value.tag
      target         = data.value.target
      type           = data.value.type
      usage          = data.value.usage
      value          = data.value.value
      weight         = data.value.weight
    }
  }

  priority = var.priority
  proxied  = var.proxied
  tags     = var.tags
  ttl      = var.ttl
  value    = var.value

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      update = timeouts.value.update
    }
  }
}