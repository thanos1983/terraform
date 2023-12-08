variable "location" {
  description = "The Azure Region where the Resource Group should exist."
  type        = string
  default     = "North Europe"
}

variable "rg_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
  default     = "InfraStructureAsCode"
}

variable "sa_name" {
  description = "Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed."
  type        = string
  default     = "saiacdaprojektetstate"
}

variable "public_network_access_enabled" {
  description = "Whether the public network access is enabled."
  type        = bool
  default     = true
}

variable "allow_nested_items_to_be_public" {
  description = "Can nested items in the storage account opt into allowing public access?"
  type        = bool
  default     = true
}

variable "container_access_type" {
  description = "The Access Level configured for this Container."
  type        = string
  default     = "container"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {
    Name     = "InfraStructureAsCode"
    Location = "North Europe"
    Team     = "DAPortal"
  }
}