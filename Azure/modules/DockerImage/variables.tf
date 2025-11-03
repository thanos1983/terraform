variable "name" {
  description = "The name of the Docker image, including any tags or SHA256 repo digests."
  type        = string
}

variable "build_block" {
  description = "Configuration to build an image."
  type = object({
    context = string
    auth_config = optional(list(object({
      host_name      = string
      auth           = optional(string)
      email          = optional(string)
      identity_token = optional(string)
      password       = optional(string)
      registry_token = optional(string)
      server_address = optional(string)
      user_name      = optional(string)
    })), [])
    build_arg       = optional(map(string))
    build_args      = optional(map(string))
    build_id        = optional(string)
    cache_from      = optional(list(string))
    cgroup_parent   = optional(string)
    cpu_period      = optional(number)
    cpu_quota       = optional(number)
    cpu_set_cpus    = optional(string)
    cpu_set_mems    = optional(string)
    cpu_shares      = optional(number)
    dockerfile      = optional(string)
    extra_hosts     = optional(list(string))
    force_remove    = optional(bool)
    isolation       = optional(string)
    label           = optional(map(string))
    labels          = optional(map(string))
    memory          = optional(number)
    memory_swap     = optional(number)
    network_mode    = optional(string)
    no_cache        = optional(bool)
    platform        = optional(string)
    pull_parent     = optional(bool)
    remote_context  = optional(string)
    remove          = optional(bool)
    security_opt    = optional(list(string))
    session_id      = optional(string)
    shm_size        = optional(number)
    squash          = optional(bool)
    suppress_output = optional(bool)
    tag             = optional(list(string))
    target          = optional(string)
    ulimit = optional(list(object({
      hard = number
      name = string
      soft = number
    })), [])
    version = optional(string)
  })
  default = null
}

variable "force_remove" {
  description = "If true, then the image is removed forcibly when the resource is destroyed."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.force_remove)))
    error_message = "Force remove docker image variable must be 'true' or 'false'."
  }
  default = false
}

variable "keep_locally" {
  description = "If true, then the Docker image won't be deleted on destroy operation."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.keep_locally)))
    error_message = "Docker image locally variable must be 'true' or 'false'."
  }
  default = false
}

variable "platform" {
  description = "The platform to use when pulling the image."
  type        = string
  default     = null
}

variable "pull_triggers" {
  description = "List of values which cause an image pull when changed."
  type        = set(string)
  default     = null
}

variable "triggers" {
  description = "A map of arbitrary strings that, when changed, will force the docker_image resource to be replaced."
  type        = map(string)
  default     = null
}

variable "insecure_skip_verify" {
  description = "If true, the verification of TLS certificates of the server/registry is disabled."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.insecure_skip_verify)))
    error_message = "TLS verification variable must be 'true' or 'false'."
  }
  default = false
}

variable "keep_remotely" {
  description = "If true, then the Docker image won't be deleted on destroy operation."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.keep_remotely)))
    error_message = "Image in order not to be deleted must be 'true' or 'false'."
  }
  default = false
}

variable "push" {
  description = "If true, then the Docker image will be pushed to the registry."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.push)))
    error_message = "TLS verification variable must be 'true' or 'false'."
  }
  default = false
}
