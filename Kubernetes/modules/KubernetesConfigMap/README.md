# The resource provides mechanisms to inject containers with configuration data while keeping containers agnostic of Kubernetes.

## Sample of use:

```bash
module "test_config_map" {
  source = "git@github.com:.../modules/KubernetesConfigMap"
  metadata_block = {
    name = "my-config-map"
  }

  data = {
    api_host             = "myhost:443"
    db_host              = "dbhost:5432"
    "my_config_file.yml" = "${file("${path.module}/my_config_file.yml")}"
  }

  binary_data = {
    "my_payload.bin" = "${filebase64("${path.module}/my_payload.bin")}"
  }
}
```

### Variables:

```bash
- metadata_block (Required)
- data (Optional)
- binary_data (Optional)
- immutable (Optional)
```

### Output:

```bash
- id
- metadata
```

###### More information can be found on the official document [kubernetes_config_map](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map)