# Time Static Resource

## Sample of use:

```bash
module "sample_time_static_<project>" {
  source   = "git::https://example.com/time_static_<my_repo>.git"
  .
  .
  .
}
```

### Variables:

```bash
- rfc3339 (Optional)
- triggers (Optional)
```

### Output:

```bash
- day
- hour
- id
- minute
- month
- second
- unix
- year
```

###### More information can be found on the official document [time_static](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/static).