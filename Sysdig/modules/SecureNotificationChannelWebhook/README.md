# Sysdig Secure Notification Channel of type Webhook

## Sample of use:

```bash
module "secure_notification_channel_webhook_<project>" {
  source = "git::https://example.com/sysdig_<my_repo>.git"
  name   = "Example Channel - Webhook"
  url    = "https://localhost:8080"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- url (Required)
- custom_data (Optional)
- enabled (Optional)
- notify_when_ok (Optional)
- notify_when_resolved (Optional)
- send_test_notification (Optional)
- share_with_current_team (Optional)
- allow_insecure_connections (Optional)
```

### Output:

```bash
- id
- version
- share_with_current_team
```

### Provider sysdiglabs/sysdig

Since this module is provided by ``sysdiglabs/sysdig`` we need to add the following on ``versions.tf`` and ``provider.tf``.
Sample of ``versions.tf`` file:

````bash
$ cat versions.tf
terraform {
  required_providers {
    sysdig = {
      source = "sysdiglabs/sysdig"
      version = "1.47.0"
    }
  }
  backend "azurerm" {}
  required_version = ">= 0.13"
}
````

Sample of ``provider.tf`` file:

````bash
$ cat provider.tf
provider "sysdig" {}
````

###### More information can be found on the official document [sysdig_secure_notification_channel_webhook](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/secure_notification_channel_webhook)