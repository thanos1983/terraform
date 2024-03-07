variable "application_id" {
  description = "The resource ID of the application for which permissions are being authorized."
  type        = string
}

variable "authorized_client_id" {
  description = "The client ID of the application being authorized."
  type        = string
}

variable "permission_ids" {
  description = "A set of permission scope IDs required by the authorized application."
  type        = set(string)
}