variable "name" {
  description = "Specifies the name which should be used for this Arc Kubernetes Cluster."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the name of the Resource Group where the Arc Kubernetes Cluster should exist."
  type        = string
}

variable "agent_public_key_certificate" {
  description = "Specifies the base64-encoded public certificate used by the agent to do the initial handshake to the backend services in Azure."
  type        = string
}

variable "identity_block" {
  description = "An identity block as defined below."
  type = object({
    type = string
  })
}

variable "location" {
  description = "Specifies the Azure Region where the Arc Kubernetes Cluster should exist."
  type        = string
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Arc Kubernetes Cluster."
  type        = map(any)
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
