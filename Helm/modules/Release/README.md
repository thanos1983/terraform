# A Release is an instance of a chart running in a Kubernetes cluster

## Sample of use:

```bash
module "helm_release<project>" {
  source   = "git::https://example.com/helm_release_<my_repo>.git"
  name = "my_helm_release"
  .
  .
  .
}
```

### Variables:

```bash
- chart (Required)
- name (Required)
- atomic (Optional)
- cleanup_on_fail (Optional)
- create_namespace (Optional)
- dependency_update (Optional)
- description (Optional)
- devel (Optional)
- disable_crd_hooks (Optional)
- disable_openapi_validation (Optional)
- disable_webhooks (Optional)
- force_update (Optional)
- keyring (Optional)
- lint (Optional)
- max_history (Optional)
- namespace (Optional)
- pass_credentials (Optional)
- postrender_block (Optional)
- recreate_pods (Optional)
- render_subchart_notes (Optional)
- replace (Optional)
- repository (Optional)
- repository_ca_file (Optional)
- repository_cert_file (Optional)
- repository_key_file (Optional)
- repository_password (Optional)
- repository_username (Optional)
- reset_values (Optional)
- reuse_values (Optional)
- set_blocks (Optional)
- set_wo_blocks (Optional)
- set_wo_revision (Optional)
- set_list_blocks (Optional)
- set_sensitive_blocks (Optional)
- skip_crds (Optional)
- timeout (Optional)
- upgrade_install (Optional)
- values (Optional)
- verify (Optional)
- version (Optional)
- wait (Optional)
- wait_for_jobs (Optional)
```

### Output:

```bash
- id
- manifest
- metadata
- status
```

###### More information can be found on the official document [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release)