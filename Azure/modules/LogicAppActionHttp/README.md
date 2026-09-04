# Manages an HTTP Action within a Logic App Workflow

## Sample of use:

```bash
module "sample_logic_app_trigger_http_request_<project>" {
  source   = "git::https://example.com/<my_repo>.git"
  name = "my_logic_app_trigger_http_request"
  .
  .
}
```

### Variables:

```bash
- name (Required)
- logic_app_id (Required)
- uri (Required)
- body (Optional)
- headers (Optional)
- queries (Optional)
- run_after_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [logic_app_action_http](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/logic_app_action_http).