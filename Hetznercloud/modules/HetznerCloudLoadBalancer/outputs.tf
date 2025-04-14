output "id" {
  description = "Unique ID of the Load Balancer."
  value       = hcloud_load_balancer.load_balancer.id
}

output "load_balancer_type" {
  description = "Name of the Type of the Load Balancer."
  value       = hcloud_load_balancer.load_balancer.load_balancer_type
}

output "name" {
  description = "Name of the Load Balancer."
  value       = hcloud_load_balancer.load_balancer.name
}

output "location" {
  description = "Name of the location the Load Balancer is in."
  value       = hcloud_load_balancer.load_balancer.location
}

output "ipv4" {
  description = "IPv4 Address of the Load Balancer."
  value       = hcloud_load_balancer.load_balancer.ipv4
}

output "ipv6" {
  description = "IPv6 Address of the Load Balancer."
  value       = hcloud_load_balancer.load_balancer.ipv6
}

output "algorithm" {
  description = "Configuration of the algorithm the Load Balancer use."
  value       = hcloud_load_balancer.load_balancer.algorithm
}

output "labels" {
  description = "User-defined labels (key-value pairs)."
  value       = hcloud_load_balancer.load_balancer.labels
}

output "delete_protection" {
  description = "Whether delete protection is enabled."
  value       = hcloud_load_balancer.load_balancer.delete_protection
}

output "network_id" {
  description = "ID of the first private network that this Load Balancer is connected to."
  value       = hcloud_load_balancer.load_balancer.network_id
}

output "network_ip" {
  description = "IP of the Load Balancer in the first private network that it is connected to."
  value       = hcloud_load_balancer.load_balancer.network_ip
}
