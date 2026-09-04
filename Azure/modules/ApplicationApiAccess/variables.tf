variable "api_client_id" {
  description = "The client ID of the API to which access is being granted. Changing this forces a new resource to be created."
  type        = string
}

variable "application_id" {
  description = "The resource ID of the application registration. Changing this forces a new resource to be created."
  type        = string
}

variable "role_ids" {
  description = "A set of role IDs to be granted to the application, as published by the API."
  type        = set(string)
  default     = null
}

variable "scope_ids" {
  description = "A set of scope IDs to be granted to the application, as published by the API."
  type        = set(string)
  default     = null
}