output "id" {
  description = "The ID of the Azure Active Directory Group."
  value       = azuread_group.group.id
}

output "mail" {
  description = "The SMTP address for the group."
  value       = azuread_group.group.mail
}

output "object_id" {
  description = "The object_id of the Azure Active Directory Group."
  value       = azuread_group.group.object_id
}

output "onpremises_domain_name" {
  description = "The on-premises FQDN, also called dnsDomainName, synchronised from the on-premises directory when Azure AD Connect is used."
  value = azuread_group.group.onpremises_domain_name
}

output "onpremises_netbios_name" {
  description = "The on-premises NetBIOS name, synchronised from the on-premises directory when Azure AD Connect is used."
  value = azuread_group.group.onpremises_netbios_name
}

output "onpremises_sam_account_name" {
  description = "The on-premises SAM account name, synchronised from the on-premises directory when Azure AD Connect is used."
  value = azuread_group.group.onpremises_sam_account_name
}

output "onpremises_security_identifier" {
  description = "The on-premises security identifier (SID), synchronised from the on-premises directory when Azure AD Connect is used."
  value = azuread_group.group.onpremises_security_identifier
}

output "onpremises_sync_enabled" {
  description = "Whether this group is synchronised from an on-premises directory (true), no longer synchronised (false), or has never been synchronised (null)."
  value = azuread_group.group.onpremises_sync_enabled
}

output "preferred_language" {
  description = "The preferred language for a Microsoft 365 group, in ISO 639-1 notation."
  value = azuread_group.group.preferred_language
}

output "proxy_addresses" {
  description = "List of email addresses for the group that direct to the same group mailbox."
  value = azuread_group.group.proxy_addresses
}