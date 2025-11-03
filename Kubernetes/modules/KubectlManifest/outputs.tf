output "yaml_body_parsed" {
  description = "Obfuscated version of yaml_body, with sensitive_fields hidden."
  value       = kubectl_manifest.manifest.yaml_body_parsed
}

output "api_version" {
  description = "Extracted API Version from yaml_body."
  value       = kubectl_manifest.manifest.api_version
}

output "kind" {
  description = "Extracted object kind from yaml_body."
  value       = kubectl_manifest.manifest.kind
}

output "name" {
  description = "Extracted object name from yaml_body."
  value       = kubectl_manifest.manifest.name
}

output "namespace" {
  description = "Extracted object namespace from yaml_body."
  value       = kubectl_manifest.manifest.namespace
}

output "uid" {
  description = "Kubernetes unique identifier from last run."
  value       = kubectl_manifest.manifest.uid
}

output "live_uid" {
  description = "Current uuid from Kubernetes."
  value       = kubectl_manifest.manifest.live_uid
}

output "yaml_incluster" {
  description = "A fingerprint of the current yaml within Kubernetes."
  value       = kubectl_manifest.manifest.yaml_incluster
}

output "live_manifest_incluster" {
  description = "A fingerprint of the current manifest within Kubernetes."
  value       = kubectl_manifest.manifest.live_manifest_incluster
}
