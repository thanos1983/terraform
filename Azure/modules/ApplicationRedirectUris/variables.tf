variable "application_id" {
  description = "The resource ID of the application registration."
  type        = string
}

variable "redirect_uris" {
  description = "A set of redirect URIs to assign to the application."
  type        = set(string)
}

variable "type" {
  description = "The type of redirect URIs to manage."
  type        = string
}
