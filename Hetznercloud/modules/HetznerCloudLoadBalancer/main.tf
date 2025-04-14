resource "hcloud_load_balancer" "load_balancer" {
  name               = var.name
  load_balancer_type = var.load_balancer_type
  location           = var.location
  network_zone       = var.network_zone

  dynamic "algorithm" {
    for_each = var.algorithm_block[*]
    content {
      type = algorithm.value.type
    }
  }

  labels            = var.labels
  delete_protection = var.delete_protection
}
