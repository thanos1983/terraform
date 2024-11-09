resource "ansible_group" "group" {
  name      = var.name
  children  = var.children
  variables = var.variables
}