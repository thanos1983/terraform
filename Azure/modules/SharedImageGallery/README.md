# Manages a Shared Image Gallery

## Sample of use:

```bash
module "shared_image_gallery_<project>" {
  source  = "git::https://example.com/shared_image_gallery_<my_repo>.git"
  name = "my_shared_image_gallery"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resource_group_name - (Required)
- location - (Required)
- description - (Optional)
- sharing - (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
- unique_name
```

###### More information can be found on the official document [azurerm_shared_image_gallery](https://registry.terraform.io/providers/hashicorp/Azurerm/latest/docs/resources/shared_image_gallery)