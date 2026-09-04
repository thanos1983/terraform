variable "claim_values" {
  description = "A set of claim values for delegated permission scopes which should be included in access tokens for the resource."
  type        = set(string)
}

variable "resource_service_principal_object_id" {
  description = "The object ID of the service principal representing the resource to be accessed. Changing this forces a new resource to be created."
  type        = string
}

variable "service_principal_object_id" {
  description = "The object ID of the service principal for which this delegated permission grant should be created. Changing this forces a new resource to be created."
  type        = string
}

variable "user_object_id" {
  description = "The object ID of the service principal for which this delegated permission grant should be created. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 5)
    read   = optional(number, 5)
    update = optional(number, 5)
    delete = optional(number, 5)
  })
  default = null
}
