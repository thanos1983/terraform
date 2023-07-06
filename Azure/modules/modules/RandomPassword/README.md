# Azure Random Password

## Sample of use:

```bash
module "password_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
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

###### More information can be found on the official document [azurerm_data_factory_custom_dataset](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_custom_dataset)