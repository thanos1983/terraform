variable "application_id" {
  description = "The resource ID of the application registration."
  type        = string
}

variable "identifier_uri" {
  description = "The user-defined URI that uniquely identifies an application within its Azure AD tenant, or within a verified custom domain if the application is multi-tenant."
  type        = string
}