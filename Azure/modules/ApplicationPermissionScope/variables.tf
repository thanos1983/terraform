variable "admin_consent_description" {
  description = "Delegated permission description that appears in all tenant-wide admin consent experiences, intended to be read by an administrator granting the permission on behalf of all users."
  type        = string
}

variable "admin_consent_display_name" {
  description = "Display name for the delegated permission, intended to be read by an administrator granting the permission on behalf of all users."
  type        = string
}

variable "application_id" {
  description = "The resource ID of the application registration."
  type        = string
}

variable "scope_id" {
  description = "The unique identifier of the permission scope."
  type        = string
}

variable "type" {
  description = "Whether this delegated permission should be considered safe for non-admin users to consent to on behalf of themselves, or whether an administrator should be required for consent to the permissions."
  type        = string
}

variable "user_consent_description" {
  description = "Delegated permission description that appears in the end user consent experience, intended to be read by a user consenting on their own behalf."
  type        = string
}

variable "user_consent_display_name" {
  description = "Display name for the delegated permission that appears in the end user consent experience."
  type        = string
}

variable "value" {
  description = "The value that is used for the scp claim in OAuth access tokens."
  type        = string
}
