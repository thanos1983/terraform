output "id" {
  description = "Unique identifier for this resource."
  value       = docker_image.image.id
}

output "name" {
  description = "Name for this resource."
  value       = docker_image.image.name
}

output "image_id" {
  description = "The ID of the image (as seen when executing docker inspect on the image)."
  value       = docker_image.image.image_id
}

output "repo_digest" {
  description = "The image sha256 digest in the form of repo[:tag]@sha256:<hash>."
  value       = docker_image.image.repo_digest
}