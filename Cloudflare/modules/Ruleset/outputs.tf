output "id" {
  description = "The identifier of this resource."
  value       = cloudflare_ruleset.ruleset.id
}

output "last_updated" {
  description = "The timestamp of when the ruleset was last modified."
  value       = cloudflare_ruleset.ruleset.last_updated
}

output "version" {
  description = "The version of the ruleset."
  value       = cloudflare_ruleset.ruleset.version
}
