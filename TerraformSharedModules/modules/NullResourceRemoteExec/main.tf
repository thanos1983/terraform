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

  provisioner "remote-exec" {
    inline  = var.inline
  }
}