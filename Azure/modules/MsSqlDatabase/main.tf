resource "azurerm_mssql_database" "mssql_database" {
  name                        = var.name
  server_id                   = var.server_id
  auto_pause_delay_in_minutes = var.auto_pause_delay_in_minutes
  create_mode                 = var.create_mode

  dynamic "import" {
    for_each = var.import_block[*]
    content {
      storage_uri                  = import.value.storage_uri
      storage_key                  = import.value.storage_key
      storage_key_type             = import.value.storage_key_type
      administrator_login          = import.value.administrator_login
      administrator_login_password = import.value.administrator_login_password
      authentication_type          = import.value.authentication_type
      storage_account_id           = import.value.storage_account_id
    }
  }

  creation_source_database_id    = var.creation_source_database_id
  collation                      = var.collation
  elastic_pool_id                = var.elastic_pool_id
  geo_backup_enabled             = var.geo_backup_enabled
  maintenance_configuration_name = var.maintenance_configuration_name
  ledger_enabled                 = var.ledger_enabled
  license_type                   = var.license_type

  dynamic "long_term_retention_policy" {
    for_each = var.long_term_retention_policy_block[*]
    content {
      weekly_retention  = long_term_retention_policy.value.weekly_retention
      monthly_retention = long_term_retention_policy.value.monthly_retention
      yearly_retention  = long_term_retention_policy.value.yearly_retention
      week_of_year      = long_term_retention_policy.value.week_of_year
    }
  }

  max_size_gb                 = var.max_size_gb
  min_capacity                = var.min_capacity
  restore_point_in_time       = var.restore_point_in_time
  recover_database_id         = var.recover_database_id
  restore_dropped_database_id = var.restore_dropped_database_id
  read_replica_count          = var.read_replica_count
  read_scale                  = var.read_scale
  sample_name                 = var.sample_name

  dynamic "short_term_retention_policy" {
    for_each = var.short_term_retention_policy_block[*]
    content {
      retention_days           = short_term_retention_policy.value.retention_days
      backup_interval_in_hours = short_term_retention_policy.value.backup_interval_in_hours
    }
  }

  sku_name             = var.sku_name
  storage_account_type = var.storage_account_type

  dynamic "threat_detection_policy" {
    for_each = var.threat_detection_policy_block[*]
    content {
      state                      = threat_detection_policy.value.state
      disabled_alerts            = threat_detection_policy.value.disabled_alerts
      email_account_admins       = threat_detection_policy.value.email_account_admins
      email_addresses            = threat_detection_policy.value.email_addresses
      retention_days             = threat_detection_policy.value.retention_days
      storage_account_access_key = threat_detection_policy.value.storage_account_access_key
      storage_endpoint           = threat_detection_policy.value.storage_endpoint
    }
  }

  transparent_data_encryption_enabled = var.transparent_data_encryption_enabled
  zone_redundant                      = var.zone_redundant

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }

  tags = var.tags
}

module "kv_secret_ado_net_sql_authentication" {
  source       = "../KeyVaultSecret"
  tags         = var.tags
  key_vault_id = var.key_vault_id
  name         = "ado-net-sql-authentication"
  value        = "Server=tcp:${azurerm_mssql_database.mssql_database.name}.windows.net,1433;Initial Catalog=${azurerm_mssql_database.mssql_database.name};Persist Security Info=False;User ID=${var.administrator_login};Password=${var.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  depends_on = [
    azurerm_mssql_database.mssql_database
  ]
}
