resource "null_resource" "resource" {
  triggers = var.triggers

  provisioner "local-exec" {
    command     = var.command
    working_dir = var.working_dir
    interpreter = var.interpreter
    environment = var.environment
    when        = create
    quiet       = var.quiet
  }
}