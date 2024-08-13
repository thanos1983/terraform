resource "grafana_team" "team" {
  name                             = var.name
  email                            = var.email
  ignore_externally_synced_members = var.ignore_externally_synced_members
  members                          = var.members
  org_id                           = var.org_id

  dynamic "preferences" {
    for_each = var.preferences_block[*]
    content {
      home_dashboard_uid = preferences.value.home_dashboard_uid
      theme              = preferences.value.theme
      timezone           = preferences.value.timezone
      week_start         = preferences.value.week_start
    }
  }

  dynamic "team_sync" {
    for_each = var.team_sync_block[*]
    content {
      groups = team_sync.value.group
    }
  }
}