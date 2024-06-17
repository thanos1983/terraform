resource "null_resource" "resource" {
  triggers = var.triggers

  connection {
    type            = var.type
    user            = var.user
    password        = var.password
    host            = var.host
    port            = var.port
    timeout         = var.timeout
    script_path     = var.script_path
    private_key     = var.private_key
    certificate     = var.certificate
    agent           = var.agent
    agent_identity  = var.agent_identity
    host_key        = var.host_key
    target_platform = var.target_platform
    https           = var.https
    insecure        = var.insecure
    use_ntlm        = var.use_ntlm
    cacert          = var.cacert
  }

  provisioner "file" {
    source      = var.file_source
    content     = var.file_content
    destination = var.file_destination
  }

  provisioner "local-exec" {
    command     = var.command
    working_dir = var.working_dir
    interpreter = var.interpreter
    environment = var.environment
    when        = create
    quiet       = var.quiet
  }

  provisioner "remote-exec" {
    inline  = var.inline
    script  = var.script
    scripts = var.scripts
  }
}