# Creating Minio S3 bucket(s) 

## Sample of use:

```bash
module "minio_s3_bucket_<project>" {
  source   = "git::https://example.com/minio_s3_bucket_<my_repo>.git"
  acl = "public"
  bucket = "state-terraform-s3"
  .
  .
  .
}
```

### Variables:

```bash
- acl (Optional)
- bucket (Optional)
- bucket_prefix (Optional)
- force_destroy (Optional)
- object_locking (Optional)
- quota (Optional)
```

### Output:

```bash
- id
- arn
- bucket_domain_name
```

###### More information can be found on the official document [minio_s3_bucket](https://registry.terraform.io/providers/aminueza/minio/latest/docs/resources/s3_bucket)