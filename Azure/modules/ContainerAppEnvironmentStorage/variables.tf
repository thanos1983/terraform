variable "name" {
  description = "The name of the Container Apps Managed Environment."
  type        = string
}

variable "container_app_environment_id" {
  description = "The ID of the Container App Environment to which this storage belongs."
  type        = string
}

variable "account_name" {
  description = "The Azure Storage Account in which the Share to be used is located."
  type        = string
}

variable "access_key" {
  description = "The Storage Account Access Key."
  type        = string
}

variable "share_name" {
  description = "The name of the Azure Storage Share to use."
  type        = string
}

variable "access_mode" {
  description = "The access mode to connect this storage to the Container App."
  type        = string
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}