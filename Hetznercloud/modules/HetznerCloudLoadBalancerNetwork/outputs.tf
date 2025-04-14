output "id" {
  description = "ID of the Load Balancer network."
  value       = hcloud_load_balancer_network.load_balancer_network.id
}

output "network_id" {
  description = "ID of the network."
  value       = hcloud_load_balancer_network.load_balancer_network.network_id
}

output "load_balancer_id" {
  description = "ID of the Load Balancer."
  value       = hcloud_load_balancer_network.load_balancer_network.load_balancer_id
}

output "ip" {
  description = "IP assigned to this Load Balancer."
  value       = hcloud_load_balancer_network.load_balancer_network.ip
}
