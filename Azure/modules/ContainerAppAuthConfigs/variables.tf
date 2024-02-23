variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "parent_id" {
  description = "To deploy to a resource group, use the ID of that resource group."
  type        = string
}

variable "globalValidation" {
  description = "The configuration settings that determines the validation flow of users using Service Authentication/Authorization."
  type        = object({
    excludedPaths               = list(string)
    redirectToProvider          = string
    unauthenticatedClientAction = string
  })
  default = {
    excludedPaths               = []
    redirectToProvider          = null
    unauthenticatedClientAction = null
  }
}

variable "httpSettings" {
  description = "The configuration settings of the HTTP requests for authentication and authorization requests made against ContainerApp Service Authentication/Authorization."
  type        = object({
    forwardProxy = object({
      convention            = string
      customHostHeaderName  = string
      customProtoHeaderName = string
    })
    requireHttps = bool
    routes       = object({
      apiPrefix = string
    })
  })
  default = {
    forwardProxy = {
      convention            = null
      customHostHeaderName  = null
      customProtoHeaderName = null
    }
    requireHttps = true
    routes       = {
      apiPrefix = null
    }
  }
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

variable "azureActiveDirectory" {
  description = "The configuration settings of the Azure Active directory provider."
  type        = object({
    enabled           = bool
    isAutoProvisioned = bool
    login             = optional(object({
      disableWWWAuthenticate = bool
      loginParameters        = optional(list(string))
    }))
    registration = object({
      clientId                                      = string
      clientSecretCertificateIssuer                 = optional(string)
      clientSecretCertificateSubjectAlternativeName = optional(string)
      clientSecretCertificateThumbprint             = optional(string)
      clientSecretSettingName                       = optional(string)
      openIdIssuer                                  = string
    })
    validation = object({
      allowedAudiences           = list(string)
      defaultAuthorizationPolicy = optional(object({
        allowedApplications = optional(list(string))
        allowedPrincipals   = optional(object({
          groups     = optional(list(string))
          identities = optional(list(string))
        }), null)
      }))
      jwtClaimChecks = optional(object({
        allowedClientApplications = optional(list(string))
        allowedGroups             = optional(list(string))
      }), null)
    })
  })
  default = null
}

variable "azureStaticWebApps" {
  description = "The configuration settings of the Azure Static Web Apps provider."
  type        = object({
    enabled      = bool
    registration = object({
      clientId = string
    })
  })
  default = null
}

variable "customOpenIdConnectProviders" {
  description = "The map of the name of the alias of each custom Open ID Connect provider to the configuration settings of the custom Open ID Connect provider."
  type        = map(any)
  default     = null
}

variable "facebook" {
  description = "The configuration settings of the Facebook provider."
  type        = object({
    enabled         = bool
    graphApiVersion = string
    login           = object({
      scopes = list(string)
    })
    registration = object({
      appId                = string
      appSecretSettingName = string
    })
  })
  default = null
}

variable "github" {
  description = "The configuration settings of the GitHub provider."
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

variable "google" {
  description = "The configuration settings of the Google provider."
  type        = object({
    enabled = bool
    login   = object({
      scopes = list(string)
    })
    registration = object({
      clientId                = string
      clientSecretSettingName = string
    })
    validation = object({
      allowedAudiences = list(string)
    })
  })
  default = null
}

variable "twitter" {
  description = "The configuration settings of the Twitter provider."
  type        = object({
    enabled      = bool
    registration = object({
      consumerKey               = string
      consumerSecretSettingName = string
    })
  })
  default = null
}

variable "login" {
  description = "The configuration settings of the login flow of users using ContainerApp Service Authentication/Authorization."
  type        = object({
    allowedExternalRedirectUrls = optional(list(string), [])
    cookieExpiration            = optional(object({
      convention       = string
      timeToExpiration = string
    }), null)
    nonce = optional(object({
      nonceExpirationInterval = string
      validateNonce           = bool
    }), null)
    preserveUrlFragmentsForLogins = bool
    routes                        = optional(object({
      logoutEndpoint = string
    }), null)
  })
  default = null
}

variable "platform" {
  description = "The configuration settings of the platform of ContainerApp Service Authentication/Authorization."
  type        = object({
    enabled        = bool
    runtimeVersion = optional(string)
  })
  default = {
    enabled = true
  }
}