resource "sysdig_user" "user" {
  email       = var.email
  system_role = var.system_role
  first_name  = var.first_name
  last_name   = var.last_name
}
