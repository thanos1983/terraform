output "id" {
  description = "The ID of this resource."
  value       = kubernetes_config_map.config_map.id
}

output "metadata" {
  description = "Standard kubernetes metadata."
  value       = kubernetes_config_map.config_map.metadata
}
