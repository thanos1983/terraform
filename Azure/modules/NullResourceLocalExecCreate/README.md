# Azure Null Resource Create

## Sample of use:

```bash
module "sample_null_resource_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  .
  .
  .
}
```

### Variables:

```bash
- triggers (Optional)
- file_source (Optional)
- file_destination (Optional)
- command (Required)
- working_dir (Optional)
- interpreter (Optional)
- environment (Optional)
- when (Optional)
- quiet (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [null_resource](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource), [File Provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/file) and [terraform/local-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec).