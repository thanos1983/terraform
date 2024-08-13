resource "grafana_user" "user" {
  email    = var.email
  password = var.password
  is_admin = var.is_admin
  login    = var.login
  name     = var.name
}