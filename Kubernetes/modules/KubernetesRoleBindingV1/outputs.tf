output "metadata" {
  description = "Standard kubernetes metadata."
  value       = kubernetes_role_binding_v1.role_binding_v1.metadata
}

output "role_ref" {
  description = "The Role to bind Subjects to."
  value       = kubernetes_role_binding_v1.role_binding_v1.role_ref
}

output "subject" {
  description = "The Users, Groups, or ServiceAccounts to grand permissions to."
  value       = kubernetes_role_binding_v1.role_binding_v1.subject
}
