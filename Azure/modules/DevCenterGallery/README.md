# Manages a Dev Center Gallery

## Sample of use:

```bash
module "dev_center_gallery_<project>" {
  source   = "git::https://example.com/dev_center_gallery_<my_repo>.git"
  name = "my_dev_center_gallery"
  .
  .
  .
}
```

### Variables:

```bash
- dev_center_id - (Required)
- shared_gallery_id - (Required)
- name - (Required)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_dev_center_gallery](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_center_gallery)
