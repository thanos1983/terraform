# Docker Image

## Sample of use:

```bash
module "docker_image_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_docker_image"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- build_block (Optional)
- force_remove (Optional)
- keep_locally (Optional)
- platform (Optional)
- pull_triggers (Optional)
- triggers (Optional)
```

### Output:

```bash
- id
- name
- image_id
- repo_digest
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

###### More information can be found on the official document [docker_image](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image)
