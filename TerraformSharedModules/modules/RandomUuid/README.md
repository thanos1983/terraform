# The resource random_uuid generates a random uuid string that is intended to be used as a unique identifier for other resources.

## Sample of use:

```bash
module "random_uuid_<project>" {
  source  = "git::https://example.com/random_uuid_<my_repo>.git"
  keepers
  .
  .
  .
}
```

### Variables:

```bash
- keepers (Optional)
```

### Output:

```bash
- id
- result
```

###### More information can be found on the official document [random_uuid](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid)