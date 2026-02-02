output "redeem_url" {
  description = "The URL the user can use to redeem their invitation."
  value       = azuread_invitation.invitation.redeem_url
}

output "user_id" {
  description = "Object ID of the invited user."
  value       = azuread_invitation.invitation.user_id
}
