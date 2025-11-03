output "manifest" {
  description = "The manifest deployment."
  value       = kubernetes_manifest.manifest.manifest
}
