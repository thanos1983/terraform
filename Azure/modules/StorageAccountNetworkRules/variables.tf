variable "storage_account_id" {
  description = "Specifies the ID of the storage account."
  type        = string
}

variable "default_action" {
  description = "Specifies the default action of allow or deny when no other rules match."
  type        = string
}

variable "bypass" {
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices."
  type        = list(string)
  default     = ["AzureServices"]
}

variable "ip_rules" {
  description = "List of public IP or IP ranges in CIDR Format."
  type        = list(string)
  default     = null
}

variable "virtual_network_subnet_ids" {
  description = "A list of virtual network subnet ids to secure the storage account."
  type        = list(string)
  default     = null
}

variable "private_link_access_blocks" {
  description = "One or more private_link_access block as defined below."
  type = list(object({
    endpoint_resource_id = string
    endpoint_tenant_id   = optional(string)
  }))
  default = []
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 60)
    update = optional(number, 60)
    read   = optional(number, 5)
    delete = optional(number, 60)
  })
  default = null
}
