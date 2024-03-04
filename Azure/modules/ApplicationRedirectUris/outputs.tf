output "redirect_uris" {
  description = "A set of redirect URIs to assign to the application."
  value       = azuread_application_redirect_uris.application_redirect_uris.redirect_uris
}