output "id" {
  description = "The ID of this resource."
  value       = kubernetes_csi_driver_v1.csi_driver_v1.id
}

output "metadata" {
  description = "The metadata of this resource."
  value       = kubernetes_csi_driver_v1.csi_driver_v1.metadata
}
