# Random String

## Sample of use:

```bash
module "string_<project>" {
  source  = "git::https://example.com/string_<my_repo>.git"
  length = 16
  .
  .
  .
}
```

### Variables:

```bash
- length (Required)
- keepers (Optional)
- lower (Optional)            
- min_lower (Optional) 
- min_numeric (Optional)
- min_special (Optional)
- min_upper (Optional)
- numeric (Optional)
- override_special (Optional)
- special (Optional)
- upper (Optional)
```

### Output:

```bash
- bcrypt_hash
- id
- result
```

###### More information can be found on the official document [random_string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)