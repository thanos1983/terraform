resource "null_resource" "resource" {
  triggers = var.triggers

  provisioner "file" {
    content     = var.file_content
    destination = var.file_destination
  }

  provisioner "local-exec" {
    command     = var.command
    working_dir = var.working_dir
    interpreter = var.interpreter
    environment = var.environment
    when        = destroy
    quiet       = var.quiet
  }
}