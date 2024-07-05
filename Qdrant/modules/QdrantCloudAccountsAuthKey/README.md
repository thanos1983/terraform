# Qdrant Account Cluster Resource

## Sample of use:

```bash
module "qdrant_cloud_accounts_cluster_<project>" {
  source   = "git::https://example.com/qdrant_cloud_accounts_cluster_<my_repo>.git"
  name = "my_qdrant_cloud_accounts_cluster"
  .
  .
  .
}
```

### Variables:

```bash
- cloud_provider (Required)
- cloud_region (Required)
- configuration_block (Required)
- name (Required)
- account_id (Optional)
- cloud_region_az (Optional)
- cloud_region_setup (Optional)
- encryption_key_id (Optional)
- private_region_id (Optional)
- total_extra_disk (Optional)
- qdrant_cluster_version (Optional)
```

### Output:

```bash
- created_at
- current_configuration_id
- id
- marked_for_deletion_at
- url
- name
```

###### More information can be found on the official document [accounts_cluster](https://registry.terraform.io/providers/qdrant/qdrant-cloud/latest/docs/resources/accounts_cluster)