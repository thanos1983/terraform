# Time Sleep Resource

## Sample of use:

```bash
module "sample_time_sleep_<project>" {
  source   = "git::https://example.com/time_sleep_<my_repo>.git"
  .
  .
  .
}
```

### Variables:

```bash
- create_duration (Optional)
- destroy_duration (Optional)
- triggers (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [time_sleep](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep).