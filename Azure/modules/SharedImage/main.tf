resource "azurerm_shared_image" "shared_image" {
  name                = var.name
  gallery_name        = var.gallery_name
  resource_group_name = var.resource_group_name
  location            = var.location

  dynamic "identifier" {
    for_each = var.identifier_block[*]
    content {
      offer     = identifier.value.offer
      publisher = identifier.value.publisher
      sku       = identifier.value.sku
    }
  }

  os_type = var.os_type

  dynamic "purchase_plan" {
    for_each = var.purchase_plan_block[*]
    content {
      name      = purchase_plan.value.name
      publisher = purchase_plan.value.publisher
      product   = purchase_plan.value.product
    }
  }

  description                         = var.description
  disk_types_not_allowed              = var.disk_types_not_allowed
  end_of_life_date                    = var.end_of_life_date
  eula                                = var.eula
  specialized                         = var.specialized
  architecture                        = var.architecture
  hyper_v_generation                  = var.hyper_v_generation
  max_recommended_vcpu_count          = var.max_recommended_vcpu_count
  min_recommended_vcpu_count          = var.min_recommended_vcpu_count
  max_recommended_memory_in_gb        = var.max_recommended_memory_in_gb
  min_recommended_memory_in_gb        = var.min_recommended_memory_in_gb
  privacy_statement_uri               = var.privacy_statement_uri
  release_note_uri                    = var.release_note_uri
  trusted_launch_supported            = var.trusted_launch_supported
  trusted_launch_enabled              = var.trusted_launch_enabled
  confidential_vm_supported           = var.confidential_vm_supported
  confidential_vm_enabled             = var.confidential_vm_enabled
  accelerated_network_support_enabled = var.accelerated_network_support_enabled
  hibernation_enabled                 = var.hibernation_enabled
  tags                                = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}
