# Time Offset Resource

## Sample of use:

```bash
module "sample_time_offset_<project>" {
  source   = "git::https://example.com/time_offset_<my_repo>.git"
  .
  .
  .
}
```

### Variables:

```bash
- base_rfc3339 (Optional)
- offset_days (Optional)
- offset_hours (Optional)
- offset_minutes (Optional)
- offset_months (Optional)
- offset_seconds (Optional)
- offset_years (Optional)
- triggers (Optional)
```

### Output:

```bash
- day
- hour
- id
- minute
- month
- rfc3339
- second
- unix
- year
```

###### More information can be found on the official document [time_offset](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/offset).