resource "azapi_resource" "container_app_auth_configs" {
  type      = "Microsoft.App/containerApps/authConfigs@2023-05-01"
  name      = var.name
  parent_id = var.parent_id

  body = jsonencode({
    properties = {
      globalValidation = var.globalValidation
      httpSettings     = var.httpSettings
      identityProviders = {
        apple                        = var.apple
        azureActiveDirectory         = var.azureActiveDirectory
        azureStaticWebApps           = var.azureStaticWebApps
        customOpenIdConnectProviders = var.customOpenIdConnectProviders
        facebook                     = var.facebook
        gitHub                       = var.github
        google                       = var.google
        twitter                      = var.twitter
      }
      login    = var.login
      platform = var.platform
    }
  })
}
