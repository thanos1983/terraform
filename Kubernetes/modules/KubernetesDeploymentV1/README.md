# A Deployment ensures that a specified number of pod “replicas” are running at any one time.

## Sample of use:

```bash
module "kubernetes_deployment_<project>" {
  source   = "git::https://example.com/kubernetes_deployment_v1_<my_repo>.git"
  metadata_block = {
    name      = "grafana-ingress"
    namespace = "grafana"
    labels = {
      "app.kubernetes.io/version"   = var.kubernetes_version
      "app.kubernetes.io/component" = "grafana"
      "app.kubernetes.io/instance"  = "grafana-terraform"
      "app.kubernetes.io/name"      = "grafanaUserInterface"
    }
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-passthrough"  = "false"
      "nginx.ingress.kubernetes.io/backend-protocol" = "HTTP"
      "cert-manager.io/cluster-issuer"               = "letsencrypt"
    }
  }
  spec_block = {
    ingress_class_name = var.ingressClass
    tls_blocks = [
      {
        secret_name = var.secret_key_ref
        hosts = ["grafana.example.com"]
      }
    ]
    rule_blocks = [
      {
        host = "grafana.example.com"
        http_blocks = [
          {
            path_blocks = [
              {
                path = "/"
                backend_block = {
                  service_block = {
                    name = "loki-grafana-loki-gateway"
                    port_block = {
                      number = 80
                    }
                  }
                }
              }
            ]
          }
        ]
      }
    ]
  }
}
```

### Variables:

```bash
- metadata_block (Required)
- spec_block (Required)
- wait_for_load_balancer (Optional)
```

### Output:

```bash
- id
- metadata
```

###### More information can be found on the official document [kubernetes_deployment_v1](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment_v1)