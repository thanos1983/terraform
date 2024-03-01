# Manages a rotating time resource, which keeps a rotating UTC timestamp stored in the Terraform state and proposes resource recreation when the locally sourced current time is beyond the rotation time.

## Sample of use:

```bash
module "my_time_rotating_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  rotation_days = 30
  .
  .
  .
}
```

### Variables:

```bash
- rfc3339 - (Optional)
- rotation_days (Optional)
- rotation_hours (Optional)
- rotation_minutes (Optional)
- rotation_months (Optional)
- rotation_rfc3339 (Optional)
- rotation_years (Optional)
- triggers (Optional)
- timeouts_block (Optional)
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

###### More information can be found on the official document [time_rotating](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/rotating)