resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
  admin_password        = var.admin_password
  admin_username        = var.admin_username
  location              = var.location
  name                  = var.name
  network_interface_ids = var.network_interface_ids

  dynamic "os_disk" {
    for_each = var.os_disk_block[*]
    content {
      caching              = var.caching
      storage_account_type = var.storage_account_type
      dynamic "diff_disk_settings" {
        for_each = var.diff_disk_settings_block[*]
        content {
          option    = diff_disk_settings.value.option
          placement = diff_disk_settings.value.placement
        }
      }
      disk_encryption_set_id           = var.disk_encryption_set_id
      disk_size_gb                     = var.disk_size_gb
      name                             = var.disk_name
      secure_vm_disk_encryption_set_id = var.secure_vm_disk_encryption_set_id
      security_encryption_type         = var.security_encryption_type
      write_accelerator_enabled        = var.write_accelerator_enabled
    }
  }

  resource_group_name = var.resource_group_name
  size                = var.size

  dynamic "additional_capabilities" {
    for_each = var.additional_capabilities_block[*]
    content {
      ultra_ssd_enabled = additional_capabilities.value.ultra_ssd_enabled
    }
  }

  dynamic "additional_unattend_content" {
    for_each = var.additional_unattend_content_blocks
    content {
      content = additional_unattend_content.value.content
      setting = additional_unattend_content.value.setting
    }
  }

  allow_extension_operations = var.allow_extension_operations
  availability_set_id        = var.availability_set_id

  dynamic "boot_diagnostics" {
    for_each = var.boot_diagnostics_block[*]
    content {
      storage_account_uri = boot_diagnostics.value.storage_account_uri
    }
  }

  capacity_reservation_group_id = var.capacity_reservation_group_id
  computer_name                 = var.computer_name
  custom_data                   = var.custom_data
  dedicated_host_id             = var.dedicated_host_id
  dedicated_host_group_id       = var.dedicated_host_group_id
  edge_zone                     = var.edge_zone
  encryption_at_host_enabled    = var.encryption_at_host_enabled
  eviction_policy               = var.eviction_policy
  extensions_time_budget        = var.extensions_time_budget

  dynamic "gallery_application" {
    for_each = var.gallery_application_blocks
    content {
      version_id             = gallery_application.value.version_id
      configuration_blob_uri = gallery_application.value.configuration_blob_uri
      order                  = gallery_application.value.order
      tag                    = gallery_application.value.tag
    }
  }

  hotpatching_enabled = var.hotpatching_enabled

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  license_type          = var.license_type
  max_bid_price         = var.max_bid_price
  patch_assessment_mode = var.patch_assessment_mode
  patch_mode            = var.patch_mode

  dynamic "plan" {
    for_each = var.plan_block[*]
    content {
      name      = plan.value.name
      product   = plan.value.product
      publisher = plan.value.publisher
    }
  }

  platform_fault_domain        = var.platform_fault_domain
  priority                     = var.priority
  provision_vm_agent           = var.provision_vm_agent
  proximity_placement_group_id = var.proximity_placement_group_id

  dynamic "secret" {
    for_each = var.secret_block[*]
    content {
      dynamic "certificate" {
        for_each = secret.value.certificate
        content {
          store = certificate.value.store
          url   = certificate.value.url
        }
      }
      key_vault_id = secret.value.key_vault_id
    }
  }

  secure_boot_enabled = var.secure_boot_enabled
  source_image_id     = var.source_image_id

  dynamic "source_image_reference" {
    for_each = var.source_image_reference_block[*]
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }

  tags = var.tags

  dynamic "termination_notification" {
    for_each = var.termination_notification_block[*]
    content {
      enabled = termination_notification.value.enabled
      timeout = termination_notification.value.timeout
    }
  }

  timezone                     = var.timezone
  user_data                    = var.user_data
  virtual_machine_scale_set_id = var.virtual_machine_scale_set_id
  vtpm_enabled                 = var.vtpm_enabled

  dynamic "winrm_listener" {
    for_each = var.winrm_listener_blocks
    content {
      protocol        = winrm_listener.value.protocol
      certificate_url = winrm_listener.value.certificate_url
    }
  }

  zone = var.zone

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
