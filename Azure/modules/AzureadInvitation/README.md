# Azure Availability Set

## Sample of use:

```bash
module "azuread_invitation_<project>" {
  source              = "git::https://example.com/azuread_invitation_<my_repo>.git"
  message_block       = {
    additional_recipients = ["aaliceberg@hashicorp.com"]
    body                  = "Hello there! You are invited to join my Azure tenant!"
    language              = "en-US"
  }
  user_email_address = "jdoe@hashicorp.com"
  redirect_url       = "https://portal.azure.com"
  .
  .
  .
}
```

### Variables:

```bash
- message_block (Optional)
- redirect_url (Required)
- user_display_name (Optional)
- user_email_address (Required)
- user_type (Optional)
- timeouts (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_availability_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/availability_set)
