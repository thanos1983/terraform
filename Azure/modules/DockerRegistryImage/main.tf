resource "docker_registry_image" "registry" {
  name                 = var.name
  insecure_skip_verify = var.insecure_skip_verify
  keep_remotely        = var.keep_remotely
  triggers             = var.triggers
}
