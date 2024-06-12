# Create a Kubernetes resource using raw YAML manifests

## Sample of use:

```bash
module "kubectl_manifest_<project>" {
  source   = "git::https://example.com/kubectl_manifest_<my_repo>.git"
  yaml_body = <<YAML
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: test-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
    azure/frontdoor: enabled
spec:
  rules:
  - http:
      paths:
      - path: /testpath
        pathType: "Prefix"
        backend:
          serviceName: test
          servicePort: 80
YAML
  .
  .
  .
}
```

### Variables:

```bash
- yaml_body (Required)
- sensitive_fields (Optional)
- force_new (Optional)
- server_side_apply (Optional)
- field_manager (Optional)
- force_conflicts (Optional)
- apply_only (Optional)
- ignore_fields (Optional)
- override_namespace (Optional)
- validate_schema (Optional)
- wait (Optional)
- wait_for_rollout (Optional)
```

### Output:

```bash
- yaml_body_parsed
- api_version
- kind
- name
- namespace
- uid
- live_uid
- yaml_incluster
- live_manifest_incluster
```

###### More information can be found on the official document [kubectl_manifest](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/kubectl_manifest)