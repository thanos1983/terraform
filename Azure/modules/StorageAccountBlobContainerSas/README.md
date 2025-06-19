# Azure Storage Account

## Sample of use:

```bash
module "storage_account_<project>" {
  source = "git::https://example.com/azure_<my_repo>.git"
  name   = "my_storage_account"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- resource_group_name (Required)
- location (Required)
- account_kind (Optional)
- account_tier (Required)
- account_replication_type (Required)
- cross_tenant_replication_enabled (Optional)
- access_tier (Optional)
- edge_zone (Optional)
- enable_https_traffic_only (Optional)
- min_tls_version (Optional)
- allow_nested_items_to_be_public (Optional)
- shared_access_key_enabled (Optional)
- public_network_access_enabled (Optional)
- network_rules_block (Optional)
- share_properties_block (Optional)
- default_to_oauth_authentication (Optional)
- is_hns_enabled (Optional)
- nfsv3_enabled (Optional)
- custom_domain_block (Optional)
- customer_managed_key_block (Optional)
- identity_block (Optional)
- blob_properties_block (Optional)
- queue_properties_block (Optional)
- static_website_block (Optional)
- sharing_properties (Optional)
- networks_rules (Optional)
- large_file_share_enabled (Optional)
- azure_files_authentication_block (Optional)
- routing_block (Optional)
- queue_encryption_key_type (Optional)
- table_encryption_key_type (Optional)
- infrastructure_encryption_enabled (Optional)
- immutability_policies (Optional)
- sas_policies (Optional)
- allowed_copy_scope (Optional)
- sftp_enabled (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- primary_location
- secondary_location
- primary_blob_endpoint
- primary_blob_host
- secondary_blob_endpoint
- secondary_blob_host
- primary_queue_endpoint
- primary_queue_host
- secondary_queue_endpoint
- secondary_queue_host
- primary_table_endpoint
- primary_table_host
- secondary_table_endpoint
- secondary_table_host
- primary_file_endpoint
- primary_file_host
- secondary_file_endpoint
- secondary_file_host
- primary_dfs_endpoint
- primary_dfs_host
- secondary_dfs_endpoint
- secondary_dfs_host
- primary_web_endpoint
- primary_web_host
- secondary_web_endpoint
- secondary_web_host
- primary_access_key
- secondary_access_key
- primary_connection_string
- secondary_connection_string
- primary_blob_connection_string
- secondary_blob_connection_string
- principal_id
- tenant_id
```

###### More information can be found on the official document [azurerm_storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account)