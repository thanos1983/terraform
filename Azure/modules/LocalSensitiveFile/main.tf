resource "local_sensitive_file" "file" {
  filename             = var.filename
  content              = var.content
  content_base64       = var.content_base64
  directory_permission = var.directory_permission
  file_permission      = var.file_permission
  source               = var.file_source
}