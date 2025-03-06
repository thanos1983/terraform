resource "sysdig_agent_access_key" "agent_access_key" {
  metadata    = var.metadata
  team_id     = var.team_id
  limit       = var.limit
  reservation = var.reservation
  enabled     = var.enabled
}
