variable "cluster_ids" {
  description = "Auth Keys Keys Schema Cluster Identifiers for which this Auth Key is attached field."
  type        = list(string)
}

variable "account_id" {
  description = "Auth Keys Keys Schema Account Identifiers where this Auth Key belongs to field."
  type        = string
  default     = null
}