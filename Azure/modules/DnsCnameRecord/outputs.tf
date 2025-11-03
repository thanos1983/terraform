output "id" {
  description = "The DNS CName Record ID."
  value       = azurerm_dns_cname_record.dns_cname_record.id
}

output "name" {
  description = "The name of DNS CName Record."
  value       = azurerm_dns_cname_record.dns_cname_record.name
}

output "fqdn" {
  description = "The FQDN of the DNS CName Record."
  value       = azurerm_dns_cname_record.dns_cname_record.fqdn
}
