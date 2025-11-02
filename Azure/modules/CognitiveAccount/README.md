# Manages a Cognitive Services Account

## Sample of use:

```bash
module "cognitive_account_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_cognitive_account"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- resource_group_name (Required)
- location (Required)
- kind (Required)
- sku_name (Required)
- custom_subdomain_name (Optional)
- dynamic_throttling_enabled (Optional)
- customer_managed_key_block (Optional)
- fqdns (Optional)
- local_auth_enabled (Optional)
- metrics_advisor_aad_client_id (Optional)
- metrics_advisor_aad_tenant_id (Optional)
- metrics_advisor_super_user_name (Optional)
- metrics_advisor_website_name (Optional)
- network_acls_block (Optional)
- outbound_network_access_restricted (Optional)
- public_network_access_enabled (Optional)
- qna_runtime_endpoint (Optional)
- custom_question_answering_search_service_id (Optional)
- custom_question_answering_search_service_key (Optional)
- storage_blocks (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
- endpoint
- identity
- primary_access_key
- secondary_access_key
```

###### More information can be found on the official document [cognitive_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account)
