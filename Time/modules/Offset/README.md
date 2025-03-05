# Time Offset

## Sample of use:

```bash
module "time_offset_<project>" {
  source = "git::https://example.com/offset_<my_repo>.git"
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

###### More information can be found on the official document [time_offset](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/offset)
