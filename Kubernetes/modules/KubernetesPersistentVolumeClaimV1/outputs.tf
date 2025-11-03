output "id" {
  description = "The id of the kubernetes persistent volume claim."
  value       = kubernetes_persistent_volume_claim_v1.persistent_volume_claim.id
}
