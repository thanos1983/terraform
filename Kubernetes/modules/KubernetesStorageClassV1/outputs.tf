output "id" {
  description = "The ID of this resource."
  value       = kubernetes_storage_class_v1.storage_class_v1.id
}

output "metadata" {
  description = "The metadata of this resource."
  value       = kubernetes_storage_class_v1.storage_class_v1.metadata
}

output "storage_provisioner" {
  description = "Indicates the type of the provisioner"
  value       = kubernetes_storage_class_v1.storage_class_v1.storage_provisioner
}
