# Azure Ms SQL database

## Sample of use:

```bash
module "masql_db_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_sql_db"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- server_id (Required)
- auto_pause_delay_in_minutes (Optional)
- create_mode (Optional)
- import_block (Optional)
- creation_source_database_id (Optional)
- collation (Optional)
- elastic_pool_id (Optional)
- geo_backup_enabled (Optional)
- maintenance_configuration_name (Optional)
- ledger_enabled (Optional)
- license_type (Optional)
- long_term_retention_policy_block (Optional)
- max_size_gb (Optional)
- min_capacity (Optional)
- restore_point_in_time (Optional)
- recover_database_id (Optional)
- restore_dropped_database_id (Optional)
- read_replica_count (Optional)
- read_scale (Optional)
- sample_name (Optional)
- short_term_retention_policy_block (Optional)
- sku_name (Optional)
- storage_account_type (Optional)
- threat_detection_policy_block (Optional)
- transparent_data_encryption_enabled (Optional)
- zone_redundant (Optional)
- timeouts_block (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_mssql_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database)
