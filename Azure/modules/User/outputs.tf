output "creation_type" {
  description = "Indicates whether the user account was created as a regular school or work account (null), an external account (Invitation), a local account for an Azure Active Directory B2C tenant (LocalAccount) or self-service sign-up using email verification (EmailVerified)."
  value       = azuread_user.user.creation_type
}

output "external_user_state" {
  description = "For an external user invited to the tenant, this property represents the invited user's invitation status."
  value       = azuread_user.user.external_user_state
}

output "im_addresses" {
  description = "A list of instant message voice over IP (VOIP) session initiation protocol (SIP) addresses for the user."
  value       = azuread_user.user.im_addresses
}

output "object_id" {
  description = "The object ID of the user."
  value       = azuread_user.user.object_id
}

output "onpremises_distinguished_name" {
  description = "The on-premises distinguished name (DN) of the user, synchronised from the on-premises directory when Azure AD Connect is used."
  value       = azuread_user.user.onpremises_distinguished_name
}

output "onpremises_domain_name" {
  description = "The on-premises FQDN, also called dnsDomainName, synchronised from the on-premises directory when Azure AD Connect is used."
  value       = azuread_user.user.onpremises_domain_name
}

output "onpremises_sam_account_name" {
  description = "The on-premise SAM account name of the user."
  value       = azuread_user.user.onpremises_sam_account_name
}

output "onpremises_security_identifier" {
  description = "The on-premises security identifier (SID), synchronised from the on-premises directory when Azure AD Connect is used."
  value       = azuread_user.user.onpremises_security_identifier
}

output "onpremises_sync_enabled" {
  description = "Whether this user is synchronised from an on-premises directory (true), no longer synchronised (false), or has never been synchronised (null)."
  value       = azuread_user.user.onpremises_sync_enabled
}

output "onpremises_user_principal_name" {
  description = "The on-premise user principal name of the user."
  value       = azuread_user.user.onpremises_user_principal_name
}

output "proxy_addresses" {
  description = "List of email addresses for the user that direct to the same mailbox."
  value       = azuread_user.user.onpremises_user_principal_name
}

output "user_type" {
  description = "The user type in the directory."
  value       = azuread_user.user.user_type
}

output "id" {
  description = "The ID of the Active Directory User."
  value       = azuread_user.user.id
}
