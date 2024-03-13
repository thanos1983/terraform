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

### file Provisioner

The [file Provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/file) copies files or directories from the machine running Terraform to the newly created resource. The file provisioner supports both ssh and winrm type connections.

### remote-exec Provisioner

The [remote-exec Provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec) invokes a script on a remote resource after it is created. This can be used to run a configuration management tool, bootstrap into a cluster, etc. To invoke a local process, see the local-exec provisioner instead. The remote-exec provisioner requires a connection and supports both ssh and winrm.

###### More information can be found on the official document [null_resource](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) and [terraform/local-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec).