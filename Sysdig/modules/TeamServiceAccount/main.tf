resource "sysdig_team_service_account" "team_service_account" {
  name            = var.name
  role            = var.role
  expiration_date = var.expiration_date
  team_id         = var.team_id
  system_role     = var.system_role
}
