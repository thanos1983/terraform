output "id" {
  description = "The ID of this resource."
  value       = docker_registry_image.registry.id
}

output "name" {
  description = "The name of this resource."
  value       = docker_registry_image.registry.name
}

output "sha256_digest" {
  description = "The sha256 digest of the image."
  value       = docker_registry_image.registry.sha256_digest
}