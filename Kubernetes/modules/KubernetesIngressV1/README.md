# Ingress is a collection of rules that allow inbound connections to reach the endpoints defined by a backend.

## Sample of use:

```bash
module "kubernetes_ingress_<project>" {
  source   = "git::https://example.com/kubernetes_ingress_v1_<my_repo>.git"
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
- status
- load_balancer
- ingress
```

#### How to import the module

Sample of code:

````bash
terraform import module.test_ingress.kubernetes_ingress_v1.ingress_v1 default/example-ingress
````

###### More information can be found on the official document [kubernetes_ingress_v1](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress_v1)