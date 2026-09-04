# Docker Registry Image

## Sample of use:

```bash
module "docker_registry_image_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_docker_registry_image"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- insecure_skip_verify (Optional)
- keep_remotely (Optional)
- triggers (Optional)
```

### Output:

```bash
- id
- name
- sha256_digest
```

The user needs to add the provider block. Sample of configuration:

```bash
provider "docker" {
  # Configuration options sample
  registry_auth {
    address  = "127.0.0.1"
    username = "example-username"
    password = "example-password"
  }
}
```

###### More information can be found on the official document [docker_registry_image](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/registry_image)