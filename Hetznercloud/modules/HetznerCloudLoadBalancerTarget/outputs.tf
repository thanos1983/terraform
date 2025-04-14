output "type" {
  description = "Type of the target."
  value       = hcloud_load_balancer_target.load_balancer_target.type
}

output "server_id" {
  description = "ID of the server which should be a target for this Load Balancer."
  value       = hcloud_load_balancer_target.load_balancer_target.server_id
}

output "label_selector" {
  description = "Label Selector selecting targets for this Load Balancer."
  value       = hcloud_load_balancer_target.load_balancer_target.label_selector
}

output "ip" {
  description = "IP address of an IP Target."
  value       = hcloud_load_balancer_target.load_balancer_target.ip
}

output "use_private_ip" {
  description = "Use the private IP to connect to Load Balancer targets."
  value       = hcloud_load_balancer_target.load_balancer_target.use_private_ip
}
