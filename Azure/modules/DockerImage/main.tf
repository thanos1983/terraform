resource "docker_image" "image" {
  name = var.name

  dynamic "build" {
    for_each = var.build_block[*]
    content {
      context = build.value.context

      dynamic "auth_config" {
        for_each = build.value.auth_config
        content {
          host_name      = auth_config.value.host_name
          auth           = auth_config.value.auth
          email          = auth_config.value.email
          identity_token = auth_config.value.identity_token
          password       = auth_config.value.password
          registry_token = auth_config.value.registry_token
          server_address = auth_config.value.server_address
          user_name      = auth_config.value.user_name
        }
      }

      build_arg       = build.value.build_arg
      build_args      = build.value.build_args
      build_id        = build.value.build_id
      cache_from      = build.value.cache_from
      cgroup_parent   = build.value.cgroup_parent
      cpu_period      = build.value.cpu_period
      cpu_quota       = build.value.cpu_quota
      cpu_set_cpus    = build.value.cpu_set_cpus
      cpu_set_mems    = build.value.cpu_set_mems
      cpu_shares      = build.value.cpu_shares
      dockerfile      = build.value.dockerfile
      extra_hosts     = build.value.extra_hosts
      force_remove    = build.value.force_remove
      isolation       = build.value.isolation
      label           = build.value.label
      labels          = build.value.labels
      memory          = build.value.memory
      memory_swap     = build.value.memory_swap
      network_mode    = build.value.network_mode
      no_cache        = build.value.no_cache
      platform        = build.value.platform
      pull_parent     = build.value.pull_parent
      remote_context  = build.value.remote_context
      remove          = build.value.remove
      security_opt    = build.value.security_opt
      session_id      = build.value.session_id
      shm_size        = build.value.shm_size
      squash          = build.value.squash
      suppress_output = build.value.suppress_output
      tag             = build.value.tag
      target          = build.value.target

      dynamic "ulimit" {
        for_each = build.value.ulimit
        content {
          hard = ulimit.value.hard
          name = ulimit.value.name
          soft = ulimit.value.soft
        }
      }

      version = build.value.version
    }
  }

  force_remove  = var.force_remove
  keep_locally  = var.keep_locally
  platform      = var.platform
  pull_triggers = var.pull_triggers
  triggers      = var.triggers
}

module "docker_registry_image" {
  source               = "../DockerRegistryImage"
  count                = var.push == false ? 0 : 1
  name                 = docker_image.image.name
  insecure_skip_verify = var.insecure_skip_verify
  keep_remotely        = var.keep_remotely
  triggers             = var.triggers
}