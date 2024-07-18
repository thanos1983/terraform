output "id" {
  description = "The ID of this resource."
  value       = kubernetes_daemon_set_v1.daemon_set_v1.id
}

output "metadata" {
  description = "The metadata of this resource."
  value = kubernetes_daemon_set_v1.daemon_set_v1.metadata
}