variable "name" {
  description = "Specifies the name which should be used for this Custom Location."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the name of the Resource Group where the Custom Location should exist."
  type        = string
}

variable "location" {
  description = "Specifies the Azure location where the Custom Location should exist."
  type        = string
}

variable "namespace" {
  description = "Specifies the namespace of the Custom Location."
  type        = string
}

variable "cluster_extension_ids" {
  description = "Specifies the list of Cluster Extension IDs."
  type        = list(string)
}

variable "host_resource_id" {
  description = "Specifies the host resource ID."
  type        = string
}

variable "authentication_block" {
  description = "An authentication block as defined below."
  type = object({
    type  = optional(string)
    value = string
  })
  default = null
}

variable "display_name" {
  description = "A display name for this API Connection."
  type        = string
  default     = null
}

variable "host_type" {
  description = "Specifies the host type of the Custom Location."
  type        = string
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}
