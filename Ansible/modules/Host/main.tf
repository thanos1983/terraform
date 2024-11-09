resource "ansible_host" "host" {
  name      = var.name
  groups    = var.groups
  variables = var.variables
}