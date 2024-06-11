output "metadata" {
  description = "Standard namespace's metadata."
  value       = kubernetes_namespace_v1.namespace.metadata
}

output "wait_for_default_service_account" {
  description = "When set to true Terraform will wait until the default service account has been asynchronously created by Kubernetes when creating the namespace resource."
  value       = kubernetes_namespace_v1.namespace.wait_for_default_service_account
}