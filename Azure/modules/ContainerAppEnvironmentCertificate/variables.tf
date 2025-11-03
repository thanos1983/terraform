variable "name" {
  description = "The name of the Container Apps Environment Certificate."
  type        = string
}

variable "container_app_environment_id" {
  description = "The Container App Managed Environment ID to configure this Certificate on."
  type        = string
}

variable "certificate_blob_base64" {
  description = "The Certificate Private Key as a base64 encoded PFX or PEM."
  type        = string
}

variable "certificate_password" {
  description = "The password for the Certificate."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}
