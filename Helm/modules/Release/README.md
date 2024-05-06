# Manages an API Connection

## Sample of use:

```bash
module "api_connection<project>" {
  source   = "git::https://example.com/api_connection_<my_repo>.git"
  name = "my_api_connection"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- chart (Required)
- repository (Optional)
- repository_key_file (Optional)
- repository_cert_file (Optional)
- repository_ca_file (Optional)
- repository_username (Optional)
- repository_password (Optional)
- devel (Optional)
- version (Optional)
- namespace (Optional)
- verify (Optional)
- keyring (Optional)
- timeout (Optional)
- disable_webhooks (Optional)
- reuse_values (Optional)
- reset_values (Optional)
- force_update (Optional)
- recreate_pods (Optional)
- cleanup_on_fail (Optional)
- max_history (Optional)
- atomic (Optional)
- skip_crds (Optional)
- render_subchart_notes (Optional)
- disable_openapi_validation (Optional)
- wait (Optional)
- wait_for_jobs (Optional)
- values (Optional)
- set_blocks (Optional)
- set_list_blocks (Optional)
- set_sensitive_blocks (Optional)
- dependency_update (Optional)
- replace (Optional)
- description (Optional)
- postrender_block (Optional)
- pass_credentials (Optional)
- lint (Optional)
- create_namespace (Optional)
```

### Output:

```bash
- manifest
- metadata
- status
```

###### More information can be found on the official document [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release)