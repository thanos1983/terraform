variable "cloud_provider" {
  description = "Cluster Schema Cloud provider where the cluster resides field."
  type        = string
}

variable "cloud_region" {
  description = "Cluster Schema Cloud region where the cluster resides field."
  type        = string
}

variable "configuration_block" {
  description = "Cluster Schema The configuration options of a cluster field."
  type = object({
    node_configuration_block = object({
      package_id = string
      // package_id = "39b48a76-2a60-4ee0-9266-6d1e0f91ea14" # free
    })
    num_nodes     = number
    num_nodes_max = number
  })
}

variable "name" {
  description = "Cluster Schema Name of the cluster field."
  type        = string
}

variable "account_id" {
  description = "Cluster Schema Identifier of the account field."
  type        = string
  default     = null
}

variable "cloud_region_az" {
  description = "Cluster Schema Cloud region availability zone where the cluster resides field."
  type        = string
  default     = null
}

variable "cloud_region_setup" {
  description = "Cluster Schema Cloud region setup of the cluster field."
  type        = string
  default     = null
}

variable "encryption_key_id" {
  description = "Cluster Schema Identifier of the encryption key field."
  type        = string
  default     = null
}

variable "private_region_id" {
  description = "Cluster Schema Identifier of the Private Region field."
  type        = string
  default     = null
}

variable "total_extra_disk" {
  description = "Cluster Schema The total amount of extra disk in relation to the chosen package (in GiB) field."
  type        = number
  default     = null
}

variable "qdrant_cluster_version" {
  description = "Cluster Schema Version of the Qdrant cluster field."
  type        = number
  default     = null
}