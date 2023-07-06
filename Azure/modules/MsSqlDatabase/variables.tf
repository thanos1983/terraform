variable "name" {
  description = "The name of the MSSQL Database."
  type        = string
}

variable "server_id" {
  description = "The id of the MSSQL Server on which to create the database. Changing this forces a new resource to be created."
  type        = string
}

variable "auto_pause_delay_in_minutes" {
  description = "Time in minutes after which database is automatically paused."
  type        = string
  default     = null
}

variable "create_mode" {
  description = "The create mode of the database."
  type        = string
  validation {
    condition = contains([
      "Copy", "Default", "OnlineSecondary", "PointInTimeRestore", "Recovery", "Restore", "RestoreExternalBackup",
      "RestoreExternalBackupSecondary", "RestoreLongTermRetentionBackup", "Secondary"
    ], title(var.create_mode))
    error_message = "DB mode variable must be \"Copy\", \"Default\", \"OnlineSecondary\", \"PointInTimeRestore\", \"Recovery\", \"Restore\", \"RestoreExternalBackup\", \"RestoreExternalBackupSecondary\" \"RestoreLongTermRetentionBackup\" or \"Secondary\"."
  }
  default = "Default"
}

variable "import_block" {
  description = "A Database Import block."
  type        = object({
    storage_uri                  = string
    storage_key                  = string
    storage_key_type             = string
    administrator_login          = string
    administrator_login_password = string
    authentication_type          = string
    storage_account_id           = optional(string)
  })
  default = null
}

variable "creation_source_database_id" {
  description = "The ID of the source database from which to create the new database."
  type        = string
  default     = null
}

variable "collation" {
  description = "Specifies the collation of the database."
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "elastic_pool_id" {
  description = "Specifies the ID of the elastic pool containing this database."
  type        = string
  default     = null
}

variable "geo_backup_enabled" {
  description = "A boolean that specifies if the Geo Backup Policy is enabled."
  type        = bool
  default     = false
}

variable "maintenance_configuration_name" {
  description = "The name of the Public Maintenance Configuration window to apply to the database."
  type        = string
  validation {
    condition = contains([
      "SQL_Default", "SQL_EastUS_DB_1", "SQL_EastUS2_DB_1", "SQL_SoutheastAsia_DB_1", "SQL_AustraliaEast_DB_1",
      "SQL_NorthEurope_DB_1", "SQL_SouthCentralUS_DB_1", "SQL_WestUS2_DB_1", "SQL_UKSouth_DB_1", "SQL_WestEurope_DB_1",
      "SQL_EastUS_DB_2", "SQL_EastUS2_DB_2", "SQL_WestUS2_DB_2", "SQL_SoutheastAsia_DB_2", "SQL_AustraliaEast_DB_2",
      "SQL_NorthEurope_DB_2", "SQL_SouthCentralUS_DB_2", "SQL_UKSouth_DB_2", "SQL_WestEurope_DB_2",
      "SQL_AustraliaSoutheast_DB_1", "SQL_BrazilSouth_DB_1", "SQL_CanadaCentral_DB_1", "SQL_CanadaEast_DB_1",
      "SQL_CentralUS_DB_1", "SQL_EastAsia_DB_1", "SQL_FranceCentral_DB_1", "SQL_GermanyWestCentral_DB_1",
      "SQL_CentralIndia_DB_1", "SQL_SouthIndia_DB_1", "SQL_JapanEast_DB_1", "SQL_JapanWest_DB_1",
      "SQL_NorthCentralUS_DB_1", "SQL_UKWest_DB_1", "SQL_WestUS_DB_1", "SQL_AustraliaSoutheast_DB_2",
      "SQL_BrazilSouth_DB_2", "SQL_CanadaCentral_DB_2", "SQL_CanadaEast_DB_2", "SQL_CentralUS_DB_2",
      "SQL_EastAsia_DB_2", "SQL_FranceCentral_DB_2", "SQL_GermanyWestCentral_DB_2", "SQL_CentralIndia_DB_2",
      "SQL_SouthIndia_DB_2", "SQL_JapanEast_DB_2", "SQL_JapanWest_DB_2", "SQL_NorthCentralUS_DB_2", "SQL_UKWest_DB_2",
      "SQL_WestUS_DB_2", "SQL_WestCentralUS_DB_1", "SQL_FranceSouth_DB_1", "SQL_WestCentralUS_DB_2",
      "SQL_FranceSouth_DB_2", "SQL_SwitzerlandNorth_DB_1", "SQL_SwitzerlandNorth_DB_2", "SQL_BrazilSoutheast_DB_1",
      "SQL_UAENorth_DB_1", "SQL_BrazilSoutheast_DB_2", "SQL_UAENorth_DB_2"
    ], title(var.maintenance_configuration_name))
    error_message = "DB maintenance variable must be \"SQL_Default\", \"SQL_EastUS_DB_1\", \"SQL_EastUS2_DB_1\", \"SQL_SoutheastAsia_DB_1\", \"SQL_AustraliaEast_DB_1\", \"SQL_NorthEurope_DB_1\", \"SQL_SouthCentralUS_DB_1\", \"SQL_WestUS2_DB_1\", \"SQL_UKSouth_DB_1\", \"SQL_WestEurope_DB_1\", \"SQL_EastUS_DB_2\", \"SQL_EastUS2_DB_2\", \"SQL_WestUS2_DB_2\", \"SQL_SoutheastAsia_DB_2\", \"SQL_AustraliaEast_DB_2\",\"SQL_NorthEurope_DB_2\", \"SQL_SouthCentralUS_DB_2\", \"SQL_UKSouth_DB_2\", \"SQL_WestEurope_DB_2\", \"SQL_AustraliaSoutheast_DB_1\", \"SQL_BrazilSouth_DB_1\", \"SQL_CanadaCentral_DB_1\", \"SQL_CanadaEast_DB_1\", \"SQL_CentralUS_DB_1\", \"SQL_EastAsia_DB_1\", \"SQL_FranceCentral_DB_1\", \"SQL_GermanyWestCentral_DB_1\", \"SQL_CentralIndia_DB_1\", \"SQL_SouthIndia_DB_1\", \"SQL_JapanEast_DB_1\", \"SQL_JapanWest_DB_1\", \"SQL_NorthCentralUS_DB_1\", \"SQL_UKWest_DB_1\", \"SQL_WestUS_DB_1\", \"SQL_AustraliaSoutheast_DB_2\", \"SQL_BrazilSouth_DB_2\", \"SQL_CanadaCentral_DB_2\", \"SQL_CanadaEast_DB_2\", \"SQL_CentralUS_DB_2\", \"SQL_EastAsia_DB_2\", \"SQL_FranceCentral_DB_2\", \"SQL_GermanyWestCentral_DB_2\", \"SQL_CentralIndia_DB_2\", \"SQL_SouthIndia_DB_2\", \"SQL_JapanEast_DB_2\", \"SQL_JapanWest_DB_2\", \"SQL_NorthCentralUS_DB_2\", \"SQL_UKWest_DB_2\", \"SQL_WestUS_DB_2\", \"SQL_WestCentralUS_DB_1\", \"SQL_FranceSouth_DB_1\", \"SQL_WestCentralUS_DB_2\", \"SQL_FranceSouth_DB_2\", \"SQL_SwitzerlandNorth_DB_1\", \"SQL_SwitzerlandNorth_DB_2\", \"SQL_BrazilSoutheast_DB_1\", \"SQL_UAENorth_DB_1\", \"SQL_BrazilSoutheast_DB_2\" or \"SQL_UAENorth_DB_2\"."
  }
  default = "SQL_Default"
}

variable "ledger_enabled" {
  description = "A boolean that specifies if this is a ledger database."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.ledger_enabled)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "license_type" {
  description = "Specifies the license type applied to this database."
  type        = string
  validation {
    condition = contains([
      "LicenseIncluded ", "BasePrice"
    ], title(var.license_type))
    error_message = "Licence type variable must be \"LicenseIncluded \" or \"BasePrice\"."
  }
  default = "BasePrice"
}

variable "long_term_retention_policy_block" {
  description = "A long_term_retention_policy block."
  type        = object({
    weekly_retention  = optional(string)
    monthly_retention = optional(string)
    yearly_retention  = optional(string)
    week_of_year      = optional(string)
  })
  default = null
}

variable "max_size_gb" {
  description = "The max size of the database in gigabytes."
  type        = number
  default     = 2
}

variable "min_capacity" {
  description = "Minimal capacity that database will always have allocated, if not paused."
  type        = string
  default     = null
}

variable "restore_point_in_time" {
  description = "Specifies the point in time (ISO8601 format) of the source database that will be restored to create the new database."
  type        = string
  default     = null
}

variable "recover_database_id" {
  description = " The ID of the database to be recovered."
  type        = string
  default     = null
}

variable "restore_dropped_database_id" {
  description = "The ID of the database to be restored."
  type        = string
  default     = null
}

variable "read_replica_count" {
  description = "The number of readonly secondary replicas associated with the database to which readonly application intent connections may be routed."
  type        = number
  default     = null
}

variable "read_scale" {
  description = "If enabled, connections that have application intent set to readonly in their connection string may be routed to a readonly secondary replica."
  type        = bool
  default     = false
}

variable "sample_name" {
  description = "Specifies the name of the sample schema to apply when creating this database."
  type        = string
  default     = null
}

variable "short_term_retention_policy_block" {
  description = " A short_term_retention_policy block."
  type        = object({
    retention_days           = number
    backup_interval_in_hours = optional(number)
  })
  default = {
    retention_days           = 35
    backup_interval_in_hours = 12
  }
}

variable "sku_name" {
  description = "Specifies the name of the SKU used by the database."
  type        = string
  validation {
    condition = contains([
      "GP_S_Gen5_2", "HS_Gen4_1", "BC_Gen5_2", "ElasticPool", "Basic", "S0", "P2", "DW100c", "DS100"
    ], title(var.sku_name))
    error_message = "Sku name must be \"GP_S_Gen5_2\", \"HS_Gen4_1\", \"BC_Gen5_2\", \"ElasticPool\", \"Basic\", \"S0\", \"P2\", \"DW100c\" or \"DS100\" ."
  }
  default = "Basic"
}

variable "storage_account_type" {
  description = "Specifies the storage account type used to store backups for this database."
  type        = string
  validation {
    condition     = contains(["Geo", "Local", "Zone"], title(var.storage_account_type))
    error_message = "Storage account type for backup must be \"Geo\", \"Local\" or \"Zone\" ."
  }
  default = "Local"
}

variable "threat_detection_policy_block" {
  description = "Threat detection policy configuration."
  type        = object({
    state                      = optional(string)
    disabled_alerts            = optional(string)
    email_account_admins       = optional(string)
    email_addresses            = optional(set(string))
    retention_days             = optional(number)
    storage_account_access_key = optional(string)
    storage_endpoint           = optional(string)
  })
  default = null
}

variable "transparent_data_encryption_enabled" {
  description = "If set to true, Transparent Data Encryption will be enabled on the database."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.transparent_data_encryption_enabled)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "zone_redundant" {
  description = "Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.zone_redundant)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 60)
    read   = optional(number, 5)
    update = optional(number, 60)
    delete = optional(number, 60)
  })
  default = null
}

variable "access_policy_kv" {
  description = "Create access policy for MSSQL DB if the user desires."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}

variable "key_vault_id" {
  description = "The key vault ID for the vault."
  type        = string
  default     = null
}

variable "administrator_login" {
  description = "The administrator login name for the SQL server."
  type        = string
  default     = null
}

variable "administrator_login_password" {
  description = "The administrator login password for the SQL server."
  type        = string
  default     = null
}