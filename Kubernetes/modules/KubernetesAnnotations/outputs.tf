output "api_version" {
  description = "The api version of this resource."
  value       = kubernetes_annotations.annotations.api_version
}

output "id" {
  description = "The ID of this resource."
  value       = kubernetes_annotations.annotations.id
}

output "kind" {
  description = "The kind of this resource."
  value       = kubernetes_annotations.annotations.kind
}

output "metadata" {
  description = "The metadata of this resource."
  value       = kubernetes_annotations.annotations.metadata
}