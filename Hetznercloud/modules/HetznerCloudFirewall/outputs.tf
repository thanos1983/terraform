output "id" {
  description = "Unique ID of the Firewall."
  value       = hcloud_firewall.firewall.id
}

output "name" {
  description = "Name of the Firewall"
  value       = hcloud_firewall.firewall.name
}

output "rule" {
  description = "Configuration of a Rule from this Firewall."
  value       = hcloud_firewall.firewall.rule
}

output "labels" {
  description = "User-defined labels (key-value pairs)."
  value       = hcloud_firewall.firewall.labels
}

output "apply_to" {
  description = "Configuration of the Applied Resources"
  value       = hcloud_firewall.firewall.apply_to
}
