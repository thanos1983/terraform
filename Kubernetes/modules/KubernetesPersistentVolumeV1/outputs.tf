output "id" {
  description = "The id of the kubernetes persistent volume."
  value       = kubernetes_persistent_volume_v1.persistent_volume.id
}

output "name" {
  description = "The name of the kubernetes persistent volume."
  value       = kubernetes_persistent_volume_v1.persistent_volume.metadata.0.name
}
