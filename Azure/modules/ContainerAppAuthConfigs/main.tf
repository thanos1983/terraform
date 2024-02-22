resource "azapi_resource" "container_app_auth_configs" {
  type      = "Microsoft.App/containerApps/authConfigs@2023-05-01"
  name      = "string"
  parent_id = "string"

  body = jsonencode({
    properties = {
      globalValidation = {
        excludedPaths               = var.excludedPaths
        redirectToProvider          = var.redirectToProvider
        unauthenticatedClientAction = var.unauthenticatedClientAction
      }
      httpSettings = {
        forwardProxy = {
          convention            = var.convention
          customHostHeaderName  = var.customHostHeaderName
          customProtoHeaderName = var.customProtoHeaderName
        }
        requireHttps = var.requireHttps
        routes       = {
          apiPrefix = var.apiPrefix
        }
      }
      identityProviders = {
        apple = {
          enabled = bool
          login   = {
            scopes = [
              "string"
            ]
          }
          registration = {
            clientId                = "string"
            clientSecretSettingName = "string"
          }
        }
        azureActiveDirectory = {
          enabled           = bool
          isAutoProvisioned = bool
          login             = {
            disableWWWAuthenticate = bool
            loginParameters        = [
              "string"
            ]
          }
          registration = {
            clientId                                      = "string"
            clientSecretCertificateIssuer                 = "string"
            clientSecretCertificateSubjectAlternativeName = "string"
            clientSecretCertificateThumbprint             = "string"
            clientSecretSettingName                       = "string"
            openIdIssuer                                  = "string"
          }
          validation = {
            allowedAudiences = [
              "string"
            ]
            defaultAuthorizationPolicy = {
              allowedApplications = [
                "string"
              ]
              allowedPrincipals = {
                groups = [
                  "string"
                ]
                identities = [
                  "string"
                ]
              }
            }
            jwtClaimChecks = {
              allowedClientApplications = [
                "string"
              ]
              allowedGroups = [
                "string"
              ]
            }
          }
        }
        azureStaticWebApps = {
          enabled      = bool
          registration = {
            clientId = "string"
          }
        }
        customOpenIdConnectProviders = {}
        facebook                     = {
          enabled         = bool
          graphApiVersion = "string"
          login           = {
            scopes = [
              "string"
            ]
          }
          registration = {
            appId                = "string"
            appSecretSettingName = "string"
          }
        }
        gitHub = {
          enabled = bool
          login   = {
            scopes = [
              "string"
            ]
          }
          registration = {
            clientId                = "string"
            clientSecretSettingName = "string"
          }
        }
        google = {
          enabled = bool
          login   = {
            scopes = [
              "string"
            ]
          }
          registration = {
            clientId                = "string"
            clientSecretSettingName = "string"
          }
          validation = {
            allowedAudiences = [
              "string"
            ]
          }
        }
        twitter = {
          enabled      = bool
          registration = {
            consumerKey               = "string"
            consumerSecretSettingName = "string"
          }
        }
      }
      login = {
        allowedExternalRedirectUrls = [
          "string"
        ]
        cookieExpiration = {
          convention       = "string"
          timeToExpiration = "string"
        }
        nonce = {
          nonceExpirationInterval = "string"
          validateNonce           = bool
        }
        preserveUrlFragmentsForLogins = bool
        routes                        = {
          logoutEndpoint = "string"
        }
      }
      platform = {
        enabled        = bool
        runtimeVersion = "string"
      }
    }
  })
}