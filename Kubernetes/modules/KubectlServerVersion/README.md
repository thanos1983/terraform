# Kubectl Server Version

## Sample of use:

```bash
module "kubectl_server_version_<project>" {
  source   = "git::https://example.com/kubectl_server_version_<my_repo>.git"
  triggers = {}
}
```

### Variables:

```bash
- triggers (Optional)
```

### Output:

```bash
- varsion
- major
- minor
- patch
- git_version
- git_commit
- build_date
- platform
```

###### More information can be found on the official document [kubectl_server_version](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/kubectl_server_version)