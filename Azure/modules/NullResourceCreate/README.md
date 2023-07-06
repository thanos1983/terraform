# Azure Null Resource Create

## Sample of use:

```bash
module "mssql_db_tables_on_create" {
  source     = "./modules/NullResourceCreate"
  for_each   = fileset(var.sql_cmd_input_files, "*.sql")
  command    = "sqlcmd -S '${local.mssql.azurerm_sql_server_name}.database.windows.net' -d '${local.mssql.azurerm_sql_database_name}' -U '${local.mssql.administrator_login}' -P '${local.mssql.administrator_login_password}' -i '${var.sql_cmd_input_files}/${each.value}' -o MyOutput.txt"
  always_run = local.mssql.azurerm_sql_database_name
}
```

### Variables:

```bash
- command - (Required)
- always_run (Required)
- working_dir (Optional)
- interpreter (Optional)
- environment (Optional)
- quiet (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [null_resource](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) and [terraform/local-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec).