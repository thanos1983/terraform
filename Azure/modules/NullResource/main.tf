resource "null_resource" "resource" {
  triggers = {
    always_run           = var.always_run
    cluster_instance_ids = var.cluster_instance_ids
  }
  provisioner "local-exec" {
    command     = var.command
    working_dir = var.working_dir
    interpreter = var.interpreter
    environment = var.environment
    when        = var.when
    quiet       = var.quiet
    inline      = var.inline
  }
}