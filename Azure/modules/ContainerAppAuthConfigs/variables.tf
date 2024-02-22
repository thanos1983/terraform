variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "parent_id" {
  description = "To deploy to a resource group, use the ID of that resource group."
  type        = string
}

variable "excludedPaths" {
  description = "The paths for which unauthenticated flow would not be redirected to the login page."
  type        = list(string)
  default     = []
}

variable "redirectToProvider" {
  description = "The default authentication provider to use when multiple providers are configured."
  type        = string
  default     = null
}

variable "unauthenticatedClientAction" {
  description = "The action to take when an unauthenticated client attempts to access the app."
  type        = string
  validation {
    condition = contains([
      "AllowAnonymous", "RedirectToLoginPage", "Return401", "Return403"
    ], title(var.unauthenticatedClientAction))
    error_message = "Possible values are 'AllowAnonymous', 'RedirectToLoginPage', 'Return401' and 'Return403'."
  }
  default = "Return403"
}

variable "convention" {
  description = "The convention used to determine the url of the request made."
  type        = string
  validation {
    condition = contains([
      "Custom", "NoProxy", "Standard"
    ], title(var.unauthenticatedClientAction))
    error_message = "Possible values are 'Custom', 'NoProxy' and 'Standard'."
  }
  default = "Standard"
}

variable "customHostHeaderName" {
  description = "The name of the header containing the host of the request."
  type        = string
  default     = null
}

variable "customProtoHeaderName" {
  description = "The name of the header containing the scheme of the request."
  type        = string
  default     = null
}

variable "requireHttps" {
  description = "false if the authentication/authorization responses not having the HTTPS scheme are permissible."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.requireHttps)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = true
}

variable "apiPrefix" {
  description = "The prefix that should precede all the authentication/authorization paths."
  type        = string
  default     = null
}

variable "apple" {
  description = "The configuration settings of the Apple provider."
  type        = object({
    enabled = bool
    login   = object({
      scopes = list(string)
    })
    registration = object({
      clientId                = string
      clientSecretSettingName = string
    })
  })
  default = null
}