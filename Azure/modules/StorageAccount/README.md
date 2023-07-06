# Azure Storage Account

## Sample of use:

```bash
module "storage_account_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_storage_account"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resource_group_name - (Required)
- location - (Required)
- account_kind - (Optional  Valid options are "BlobStorage", "BlockBlobStorage", "FileStorage", "Storage" and "StorageV2")
- account_tier - (Required Valid options are "Standard" and "Premium")
- account_replication_type - (Required  Valid options are "LRS", "GRS", "RAGRS", "ZRS", "GZRS" and "RAGZRS")
- cross_tenant_replication_enabled - (Optional boolean default: true)
- access_tier - (Optional Valid options are "Hot" and "Cool")
- edge_zone - (Optional)
- enable_https_traffic_only - (Optional boolean default: true)
- min_tls_version - (Optional Possible values are "TLS1_0", "TLS1_1", and "TLS1_2")
- allow_nested_items_to_be_public - (Optional boolean default: true)
- shared_access_key_enabled - (Optional boolean default: true)
- public_network_access_enabled - (Optional boolean default: true)
- default_to_oauth_authentication - (Optional boolean default: false)
- is_hns_enabled - (Optional boolean default: false)
- nfsv3_enabled - (Optional boolean default: false)
- custom_domains - (Optional block)
- customer_managed_keys - (Optional block)
- identities - (Optional block)
- blobs_properties - (Optional block)
- queues_properties - (Optional block)
- static_websites - (Optional block)
- sharing_properties - (Optional block)
- networks_rules - (Optional block)
- large_file_share_enabled - (Optional boolean default: false)
- azure_files_authentications - (Optional block)
- routings - (Optional block)
- queue_encryption_key_type - (Optional Possible values are "Service" and "Account")
- table_encryption_key_type - (Optional Possible values are "Service" and "Account")
- infrastructure_encryption_enabled - (Optional boolean default: false)
- immutability_policies - (Optional block)
- sas_policies - (Optional block)
- allowed_copy_scope - (Optional Possible values are "AAD" and "PrivateLink")
- sftp_enabled - (Optional boolean default: false)
- tags - (Optional)
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