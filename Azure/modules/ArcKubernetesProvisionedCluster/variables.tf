variable "name" {
  description = "The name which should be used for this Arc Kubernetes Provisioned Cluster."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Arc Kubernetes Provisioned Cluster should exist."
  type        = string
}

variable "identity_block" {
  description = "An identity block as defined below."
  type = object({
    type = string
  })
}

variable "location" {
  description = "The Azure Region where the Arc Kubernetes Provisioned Cluster should exist."
  type        = string
}

variable "arc_agent_auto_upgrade_enabled" {
  description = "Whether the Arc agents will be upgraded automatically to the latest version."
  type        = bool
  default     = true
}

variable "arc_agent_desired_version" {
  description = "The version of the Arc agents to be installed on the cluster."
  type        = string
  default     = null
}

variable "azure_active_directory_block" {
  description = "An azure_active_directory block as defined below."
  type = object({
    admin_group_object_ids = optional(list(string))
    azure_rbac_enabled = optional(bool, false)
    tenant_id = optional(string)
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Arc Kubernetes Provisioned Cluster."
  type = map(any)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 30)
    read = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}
