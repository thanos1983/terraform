output "metadata" {
  description = "Standard service account's metadata."
  value       = kubernetes_service_account_v1.service_account.metadata
}

output "image_pull_secret" {
  description = "A list of references to secrets in the same namespace to use for pulling any images in pods that reference this Service Account."
  value       = kubernetes_service_account_v1.service_account.image_pull_secret
}

output "secret" {
  description = "A list of secrets allowed to be used by pods running using this Service Account."
  value       = kubernetes_service_account_v1.service_account.secret
}

output "automount_service_account_token" {
  description = "Boolean, true to enable automatic mounting of the service account token."
  value       = kubernetes_service_account_v1.service_account.automount_service_account_token
}