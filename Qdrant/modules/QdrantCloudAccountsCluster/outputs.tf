output "created_at" {
  description = "Cluster Schema Timestamp when the cluster is created field."
  value       = qdrant-cloud_accounts_cluster.accounts_cluster.created_at
}

output "current_configuration_id" {
  description = "Cluster Schema Identifier of the current configuration field."
  value       = qdrant-cloud_accounts_cluster.accounts_cluster.current_configuration_id
}

output "id" {
  description = "Cluster Schema Identifier of the cluster field."
  value       = qdrant-cloud_accounts_cluster.accounts_cluster.id
}

output "marked_for_deletion_at" {
  description = "Cluster Schema Timestamp when this cluster was marked for deletion field."
  value       = qdrant-cloud_accounts_cluster.accounts_cluster.marked_for_deletion_at
}

output "url" {
  description = "Cluster Schema The URL of the endpoint of the Qdrant cluster field."
  value       = qdrant-cloud_accounts_cluster.accounts_cluster.url
}

output "name" {
  description = "Cluster Schema Name of the cluster field."
  value       = qdrant-cloud_accounts_cluster.accounts_cluster.name
}