resource "qdrant-cloud_accounts_auth_key" "accounts_auth_key" {
  cluster_ids = var.cluster_ids
  account_id  = var.account_id
}