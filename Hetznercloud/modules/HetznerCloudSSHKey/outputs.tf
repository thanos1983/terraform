output "id" {
  description = "ID of the SSH Key."
  value       = hcloud_ssh_key.ssh_key.id
}

output "fingerprint" {
  description = "Fingerprint of the SSH public key."
  value       = hcloud_ssh_key.ssh_key.fingerprint
}
