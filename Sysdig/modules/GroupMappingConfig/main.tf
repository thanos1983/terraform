resource "sysdig_group_mapping_config" "group_mapping_config" {
  no_mapping_strategy               = var.no_mapping_strategy
  different_team_same_role_strategy = var.different_team_same_role_strategy
}
