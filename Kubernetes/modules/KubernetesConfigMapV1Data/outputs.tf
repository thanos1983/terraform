output "id" {
  description = "The ID of this resource."
  value       = kubernetes_config_map_v1_data.config_map_data.id
}

output "metadata" {
  description = "Standard kubernetes metadata."
  value       = kubernetes_config_map_v1_data.config_map_data.metadata
}
