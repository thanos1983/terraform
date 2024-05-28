output "id" {
  description = "The id of this resource."
  value       = ansible_playbook.playbook.id
}

output "ansible_playbook_stderr" {
  description = "An ansible-playbook CLI stderr output."
  value       = ansible_playbook.playbook.ansible_playbook_stderr
}

output "ansible_playbook_stdout" {
  description = "An ansible-playbook CLI stdout output."
  value       = ansible_playbook.playbook.ansible_playbook_stdout
  sensitive   = true
}

output "args" {
  description = "Used to build arguments to run Ansible playbook with."
  value       = ansible_playbook.playbook.args
  sensitive   = true
}

output "temp_inventory_file" {
  description = "Path to created temporary inventory file."
  value       = ansible_playbook.playbook.temp_inventory_file
  sensitive   = true
}