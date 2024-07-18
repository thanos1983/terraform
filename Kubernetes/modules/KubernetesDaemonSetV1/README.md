# A DaemonSet ensures that all (or some) Nodes run a copy of a Pod.

## Sample of use:

```bash
module "kubernetes_daemon_set_<project>" {
  source   = "git::https://example.com/kubernetes_daemon_set_<my_repo>.git"
  metadata_block = {
    name      = "terraform-example"
    namespace = "default"
    labels = {
      test = "MyExampleApp"
    }
  }
  spec_block = {
    replicas = 2

    selector_block = {
      match_labels = {
        test = "MyExampleApp"
      }
    }

    template_block = {
      metadata_block = {
        labels = {
          test = "MyExampleApp"
        }
      }

      spec_block = {
        container_blocks = [
          {
            image = "nginx:1.21.6"
            name  = "example"

            resources_block = {
              limits = {
                cpu    = "0.5"
                memory = "512Mi"
              }
              requests = {
                cpu    = "250m"
                memory = "50Mi"
              }
            }

            liveness_probe_blocks = [
              {
                http_get_block = {
                  path = "/"
                  port = 80

                  http_header_block = {
                    name  = "X-Custom-Header"
                    value = "Awesome"
                  }

                  initial_delay_seconds = 3
                  period_seconds        = 3
                }
              }
            ]
          }
        ]
      }
    }
  }
}
```

### Variables:

```bash
- metadata_block (Required)
- spec_block (Required)
- timeouts_block (Optional)
- wait_for_rollout (Optional)
```

### Output:

```bash
- id
- metadata
```

###### More information can be found on the official document [kubernetes_daemon_set_v1](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/daemon_set_v1)