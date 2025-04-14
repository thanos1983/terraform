output "protocol" {
  description = "Protocol of the service."
  value       = hcloud_load_balancer_service.load_balancer_service.protocol
}

output "listen_port" {
  description = "Port the service listen on."
  value       = hcloud_load_balancer_service.load_balancer_service.listen_port
}

output "destination_port" {
  description = "Port the service connects to the targets on."
  value       = hcloud_load_balancer_service.load_balancer_service.destination_port
}

output "proxyprotocol" {
  description = "Enable proxyprotocol."
  value       = hcloud_load_balancer_service.load_balancer_service.proxyprotocol
}

output "http" {
  description = "List of http configurations when protocol is http or https."
  value       = hcloud_load_balancer_service.load_balancer_service.http
}

output "health_check" {
  description = "List of http configurations when protocol is http or https."
  value       = hcloud_load_balancer_service.load_balancer_service.health_check
}
