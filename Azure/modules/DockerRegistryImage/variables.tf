variable "name" {
  description = "The name of the Docker image, including any tags or SHA256 repo digests."
  type        = string
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
    error_message = "TLS verification variable must be 'true' or 'false'."
  }
  default = false
}

variable "triggers" {
  description = "A map of arbitrary strings that, when changed, will force the docker_image resource to be replaced."
  type        = map(string)
  default     = null
}
