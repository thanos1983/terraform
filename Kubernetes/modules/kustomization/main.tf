resource "kustomization_resource" "resource" {
  provider = kustomization
  manifest = var.manifest
}