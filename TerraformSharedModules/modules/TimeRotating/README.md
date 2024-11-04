# Time Rotating Resource

## Sample of use:

```bash
module "sample_time_rotating_<project>" {
  source   = "git::https://example.com/time_rotating_<my_repo>.git"
  .
  .
  .
}
```

### Variables:

```bash
- rfc3339 (Optional)
- rotation_days (Optional)
- rotation_hours (Optional)
- rotation_minutes (Optional)
- rotation_months (Optional)
- rotation_rfc3339 (Optional)
- rotation_years (Optional)
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

###### More information can be found on the official document [time_rotating](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/rotating).