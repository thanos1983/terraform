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
- command (Optional)
- working_dir (Optional)
- interpreter (Optional)
- environment (Optional)
- when (Optional)
- quiet (Optional)
- inline (Optional)
```

### Output:

```bash
- id
```

### remote-exec Provisioner

A very interesting feature that might be useful also [remote-exec Provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec).

###### More information can be found on the official document [null_resource](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) and [terraform/local-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec).