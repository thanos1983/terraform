output "id" {
  description = "The object id of the manifest deployment."
  value       = kubernetes_manifest.manifest.id
}