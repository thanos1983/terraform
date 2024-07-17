output "id" {
  description = "The ID of this resource."
  value       = kubernetes_deployment_v1.deployment_v1.id
}

output "metadata" {
  description = "The metadata of this resource."
  value = kubernetes_deployment_v1.deployment_v1.metadata
}