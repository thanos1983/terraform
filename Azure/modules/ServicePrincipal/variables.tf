variable "account_enabled" {
  description = "Whether or not the service principal account is enabled."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.account_enabled)))
    error_message = "Boolean flag must be 'true' or 'false'."
  }
  default = true
}

variable "alternative_names" {
  description = "A set of alternative names, used to retrieve service principals by subscription, identify resource group and full resource ids for managed identities."
  type        = set(string)
  default     = []
}

variable "app_role_assignment_required" {
  description = "Whether this service principal requires an app role assignment to a user or group before Azure AD will issue a user or access token to the application."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.app_role_assignment_required)))
    error_message = "Boolean flag must be 'true' or 'false'."
  }
  default = false
}

variable "client_id" {
  description = "The client ID of the application for which to create a service principal."
  type        = string
}

variable "description" {
  description = "A description of the service principal provided for internal end-users."
  type        = string
  default     = null
}

variable "feature_tags_block" {
  description = "A feature_tags block as described below."
  type = object({
    custom_single_sign_on = optional(bool)
    enterprise            = optional(bool)
    gallery               = optional(bool)
    hide                  = optional(bool)
  })
  default = null
}

variable "login_url" {
  description = "The URL where the service provider redirects the user to Azure AD to authenticate."
  type        = string
  default     = null
}

variable "notes" {
  description = "A free text field to capture information about the service principal, typically used for operational purposes."
  type        = string
  default     = null
}

variable "notification_email_addresses" {
  description = "A set of email addresses where Azure AD sends a notification when the active certificate is near the expiration date."
  type        = set(string)
  default     = []
}

variable "owners" {
  description = "A set of object IDs of principals that will be granted ownership of the service principal."
  type        = set(string)
  default     = []
}

variable "preferred_single_sign_on_mode" {
  description = "The single sign-on mode configured for this application."
  type        = string
  validation {
    condition     = contains(["oidc", "password", "saml", "notSupported"], lower(var.preferred_single_sign_on_mode))
    error_message = "Possible values include 'oidc', 'password', 'saml' and 'notSupported'."
  }
  default = "password"
}

variable "saml_single_sign_on_block" {
  description = "A saml_single_sign_on block as documented below."
  type = object({
    relay_state = optional(string)
  })
  default = null
}

variable "use_existing" {
  description = "When true, any existing service principal linked to the same application will be automatically imported."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.use_existing)))
    error_message = "Boolean flag must be 'true' or 'false'."
  }
  default = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "kv_secret_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
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

variable "key_vault_id" {
  description = "The key vault ID for the vault."
  type        = string
  default     = null
}

variable "display_name" {
  description = "A display name for the password. Changing this field forces a new resource to be created."
  type        = string
  default     = null
}

variable "end_date" {
  description = "Specifies the supported Azure location where the Public IP should exist."
  type        = string
  default     = null
}

variable "end_date_relative" {
  description = "A relative duration for which the password is valid until, for example 240h (10 days) or 2400h30m."
  type        = string
  default     = null
}

variable "rotate_when_changed" {
  description = "A map of arbitrary key/value pairs that will force recreation of the password when they change, enabling password rotation based on external conditions such as a rotating timestamp."
  type        = map(any)
  default     = null
}

variable "start_date" {
  description = "The start date from which the password is valid, formatted as an RFC3339 date string (e.g. 2018-01-01T01:02:03Z)."
  type        = string
  default     = null
}

variable "application_id" {
  description = "The resource ID of the application for which this password should be created."
  type        = string
  default     = null
}