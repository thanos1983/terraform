variable "description" {
  description = "A description of the application, as shown to end users."
  type        = string
  default     = null
}

variable "display_name" {
  description = "The display name for the application."
  type        = string
}

variable "group_membership_claims" {
  description = "Configures the groups claim issued in a user or OAuth 2.0 access token that the app expects."
  type        = set(string)
  default     = null
}

variable "homepage_url" {
  description = "Home page or landing page of the application."
  type        = string
  default     = null
}

variable "implicit_access_token_issuance_enabled" {
  description = "Whether this web application can request an access token using OAuth implicit flow."
  type        = string
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.implicit_access_token_issuance_enabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "implicit_id_token_issuance_enabled" {
  description = "Whether this web application can request an ID token using OAuth implicit flow."
  type        = string
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.implicit_id_token_issuance_enabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "logout_url" {
  description = "The URL that will be used by Microsoft's authorization service to sign out a user using front-channel, back-channel or SAML logout protocols."
  type        = string
  default     = null
}

variable "marketing_url" {
  description = "URL of the application's marketing page."
  type        = string
  default     = null
}

variable "notes" {
  description = "User-specified notes relevant for the management of the application."
  type        = string
  default     = null
}

variable "privacy_statement_url" {
  description = "URL of the application's privacy statement."
  type        = string
  default     = null
}

variable "requested_access_token_version" {
  description = "The access token version expected by this resource."
  type        = number
  validation {
    condition     = var.requested_access_token_version >= 1 && var.requested_access_token_version <= 2
    error_message = "Accepted nubered values: 1 or 2."
  }
  default = 2
}

variable "service_management_reference" {
  description = "References application context information from a Service or Asset Management database."
  type        = string
  default     = null
}

variable "sign_in_audience" {
  description = "The Microsoft account types that are supported for the current application."
  type        = string
  validation {
    condition = contains([
      "AzureADMyOrg", "AzureADMultipleOrgs", "AzureADandPersonalMicrosoftAccount", "PersonalMicrosoftAccount"
    ], title(var.sign_in_audience))
    error_message = "Possible values can be \"AzureADMyOrg\", \"AzureADMultipleOrgs\", \"AzureADandPersonalMicrosoftAccount\" or \"PersonalMicrosoftAccount\" string."
  }
  default = "AzureADMyOrg"
}

variable "support_url" {
  description = "URL of the application's support page."
  type        = string
  default     = null
}

variable "terms_of_service_url" {
  description = "URL of the application's terms of service statement."
  type        = string
  default     = null
}