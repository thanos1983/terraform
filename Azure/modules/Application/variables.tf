variable "api_block" {
  description = "An api block as documented below, which configures API related settings for this application."
  type        = object({
    known_client_applications      = optional(set(string))
    mapped_claims_enabled          = optional(bool)
    oauth2_permission_scope_blocks = optional(list(object({
      admin_consent_description  = string
      admin_consent_display_name = string
      enabled                    = optional(bool)
      id                         = string
      type                       = optional(string)
      user_consent_description   = optional(string)
      user_consent_display_name  = optional(string)
      value                      = optional(string)
    })), [])
    requested_access_token_version = optional(number)
  })
  default = null
}

variable "app_role_blocks" {
  description = "A collection of app_role blocks as documented below."
  type        = list(object({
    allowed_member_types = list(string)
    description          = string
    display_name         = string
    enabled              = optional(bool)
    id                   = string
    value                = optional(string)
  }))
  default = []
}

variable "description" {
  description = "A description of the application, as shown to end users."
  type        = string
  default     = null
}

variable "device_only_auth_enabled" {
  description = "Specifies whether this application supports device authentication without a user."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.device_only_auth_enabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "display_name" {
  description = "The display name for the application."
  type        = string
}

variable "fallback_public_client_enabled" {
  description = "Specifies whether the application is a public client."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.fallback_public_client_enabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "feature_tags_block" {
  description = "A feature_tags block as described below."
  type        = object({
    custom_single_sign_on = optional(bool)
    enterprise            = optional(bool)
    gallery               = optional(bool)
    hide                  = optional(bool)
  })
  default = null
}

variable "group_membership_claims" {
  description = "Configures the groups claim issued in a user or OAuth 2.0 access token that the app expects."
  type        = set(string)
  default     = null
}

variable "identifier_uris" {
  description = "A set of user-defined URI(s) that uniquely identify an application within its Azure AD tenant, or within a verified custom domain if the application is multi-tenant."
  type        = set(string)
  default     = null
}

variable "logo_image" {
  description = "A logo image to upload for the application, as a raw base64-encoded string."
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

variable "oauth2_post_response_required" {
  description = "Specifies whether, as part of OAuth 2.0 token requests, Azure AD allows POST requests, as opposed to GET requests."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.oauth2_post_response_required)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "optional_claims_block" {
  description = "An optional_claims block as documented below."
  type        = object({
    access_token_blocks = optional(list(object({
      additional_properties = optional(list(string))
      essential             = optional(string)
      name                  = string
      source                = optional(string)
    })), [])
    id_token_blocks = optional(list(object({
      additional_properties = optional(list(string))
      essential             = optional(string)
      name                  = string
      source                = optional(string)
    })), [])
    saml2_token_blocks = optional(list(object({
      additional_properties = optional(list(string))
      essential             = optional(string)
      name                  = string
      source                = optional(string)
    })), [])
  })
  default = null
}

variable "owners" {
  description = "A set of object IDs of principals that will be granted ownership of the application."
  type        = set(string)
  default     = null
}

variable "prevent_duplicate_names" {
  description = "If true, will return an error if an existing application is found with the same name."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.prevent_duplicate_names)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "privacy_statement_url" {
  description = "URL of the application's privacy statement."
  type        = string
  default     = null
}

variable "public_client_block" {
  description = "A public_client block as documented below, which configures non-web app or non-web API application settings, for example mobile or other public clients such as an installed application running on a desktop device."
  type        = object({
    redirect_uris = optional(string)
  })
  default = null
}

variable "required_resource_access_blocks" {
  description = "A collection of required_resource_access blocks as documented below."
  type        = list(object({
    resource_access_blocks = list(object({
      id   = string
      type = string
    }))
    resource_app_id = string
  }))
  default = []
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

variable "single_page_application_block" {
  description = "A single_page_application block as documented below, which configures single-page application (SPA) related settings for this application."
  type        = object({
    redirect_uris = optional(list(string))
  })
  default = null
}

variable "support_url" {
  description = "URL of the application's support page."
  type        = string
  default     = null
}

variable "tags" {
  description = "A set of tags to apply to the application for configuring specific behaviours of the application and linked service principals."
  type        = set(string)
  default     = null
}

variable "template_id" {
  description = "Unique ID for a templated application in the Azure AD App Gallery, from which to create the application."
  type        = string
  default     = null
}

variable "terms_of_service_url" {
  description = "URL of the application's terms of service statement."
  type        = string
  default     = null
}

variable "web_block" {
  description = "A web block as documented below, which configures web related settings for this application."
  type        = object({
    homepage_url         = optional(string)
    implicit_grant_block = optional(object({
      access_token_issuance_enabled = optional(bool)
      id_token_issuance_enabled     = optional(bool)
    }), null)
    logout_url    = optional(string)
    redirect_uris = optional(set(string))
  })
  default = null
}