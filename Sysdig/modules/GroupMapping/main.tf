resource "sysdig_group_mapping" "group_mapping" {
  group_name  = var.group_name
  role        = var.role
  system_role = var.system_role

  dynamic "team_map" {
    for_each = var.team_map_block[*]
    content {
      all_teams = team_map.value.all_teams
      team_ids  = team_map.value.team_ids
    }
  }

  weight = var.weight
}
