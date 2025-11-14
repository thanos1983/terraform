# Kubernetes Cluster

## Sample of use:

```bash
module "kubernetes_cluster_<project>" {
  source  = "git::https://example.com/kubernetes_cluster_<my_repo>.git"
  name = "my_kubernetes_cluster"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- tenant_id (Required)
- object_id (Required)
- application_id (Optional)
- certificate_permissions (Optional)
- key_permissions (Optional)
- secret_permissions (Optional)
- storage_permissions  (Optional)
```

### Output:

```bash
- id
- current_kubernetes_version
- fqdn
- private_fqdn
- portal_fqdn
- kube_admin_config
- kube_admin_config_raw
- kube_config
- kube_config_raw
- http_application_routing_zone_name
- oidc_issuer_url
- node_resource_group
- node_resource_group_id
- ingress_application_gateway
- oms_agent
- key_vault_secrets_provider
- aci_connector_linux
- kubelet_identity
- network_profile
- identity
- web_app_routing
```

###### More information can be found on the official document [azurerm_kubernetes_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster)
