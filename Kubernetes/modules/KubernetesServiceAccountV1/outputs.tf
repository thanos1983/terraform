output "version" {
  description = "Version of the server, e.g. v1.12.10."
  value       = kubectl_server_version.current.version
}

output "major" {
  description = "Major version, server if available, e.g. 1."
  value       = kubectl_server_version.current.major
}

output "minor" {
  description = "Minor version, server if available, e.g. 12."
  value       = kubectl_server_version.current.minor
}

output "patch" {
  description = "Patch version, server if available, e.g. 10."
  value       = kubectl_server_version.current.patch
}

output "git_version" {
  description = "Version of the server, e.g. v1.12.10-eks-aae39f."
  value       = kubectl_server_version.current.git_version
}

output "git_commit" {
  description = "Git sha commit, e.g. aae39f4697508697bf16c0de4a5687d464f4da81."
  value       = kubectl_server_version.current.git_commit
}

output "build_date" {
  description = "Date server binaries were build, e.g. 2019-12-23T08:19:12Z."
  value       = kubectl_server_version.current.build_date
}

output "platform" {
  description = "Server platform name, e.g. linux/amd64."
  value       = kubectl_server_version.current.platform
}