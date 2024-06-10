output "metadata" {
  description = "Standard namespace's metadata."
  value       = kubernetes_namespace_v1.namespace.metadata
}