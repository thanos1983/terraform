# Reads a file that contains sensitive data, from the local filesystem

## Sample of use:

```bash
module "sample_local_file_<project>" {
  source   = "git::https://example.com/<my_repo>.git"
  .
  .
  .
}
```

### Variables:

```bash
- filename (Required)
- content (Optional)
- content_base64 (Optional)
- directory_permission (Optional)
- file_permission (Optional)
- source (Optional)
```

### Output:

```bash
- content_base64sha256
- content_base64sha512
- content_md5
- content_sha1
- content_sha256
- content_sha512
- id
```

###### More information can be found on the official document [local_sensitive_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/sensitive_file).