output "id" {
  description = "The id of the kubernetes persistent volume claim."
  value       = kubernetes_persistent_volume_claim_v1.persistent_volume_claim.id
}

output "name" {
  description = "The name of the kubernetes persistent volume claim."
  value       = kubernetes_persistent_volume_claim_v1.persistent_volume_claim.metadata.0.name
}