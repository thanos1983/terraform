output "manifest" {
  description = "The rendered manifest of the release as JSON. Enable the manifest experiment to use this feature."
  value       = helm_release.release.manifest
}

output "metadata" {
  description = "Block status of the deployed release."
  value       = helm_release.release.metadata
}

output "status" {
  description = "Status of the release."
  value       = helm_release.release.status
}