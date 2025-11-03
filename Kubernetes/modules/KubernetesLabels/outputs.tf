output "id" {
  description = "The ID of this resource."
  value       = kubernetes_labels.labels.id
}

output "kind" {
  description = "The kind of this resource."
  value       = kubernetes_labels.labels.kind
}

output "labels" {
  description = "The labels of this resource."
  value       = kubernetes_labels.labels.labels
}

output "metadata" {
  description = "The metadata of this resource."
  value       = kubernetes_labels.labels.metadata
}
