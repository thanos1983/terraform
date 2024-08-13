output "id" {
  description = "A UUID identifying the resource in Terraform state."
  value       = acme_certificate.certificate.id
}

output "certificate_url" {
  description = "The full URL of the certificate within the ACME CA."
  value       = acme_certificate.certificate.certificate_url
}

output "certificate_domain" {
  description = "The common name of the certificate."
  value       = acme_certificate.certificate.certificate_domain
}

output "private_key_pem" {
  description = "The certificate's private key, in PEM format, if the certificate was generated from scratch and not with certificate_request_pem."
  value       = acme_certificate.certificate.private_key_pem
}

output "certificate_pem" {
  description = "The certificate in PEM format. This does not include the issuer_pem."
  value       = acme_certificate.certificate.certificate_pem
}

output "issuer_pem" {
  description = "The intermediate certificates of the issuer."
  value       = acme_certificate.certificate.issuer_pem
}

output "certificate_p12" {
  description = "The certificate, any intermediates, and the private key archived as a PFX file (PKCS12 format, generally used by Microsoft products)."
  value       = acme_certificate.certificate.certificate_p12
}

output "certificate_not_after" {
  description = "The expiry date of the certificate, laid out in RFC3339 format (2006-01-02T15:04:05Z07:00)."
  value       = acme_certificate.certificate.certificate_not_after
}