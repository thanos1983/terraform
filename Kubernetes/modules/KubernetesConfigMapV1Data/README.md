# The resource provides mechanisms to inject containers with configuration data while keeping containers agnostic of Kubernetes.

## Sample of use:

```bash
module "test_config_map_v1" {
  source = "git@github.com:.../modules/KubernetesConfigMapV1Data"
  metadata_block = {
    name = "my-config"
  }

  data = {
    "owner" = "myteam"
  }
}
```

### Variables:

```bash
- metadata_block (Required)
- data (Required)
- field_manager (Optional)
- force (Optional)
```

### Output:

```bash
- id
- metadata
```

###### More information can be found on the official document [kubernetes_config_map_v1_data](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map_v1_data)
