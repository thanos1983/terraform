module "password" {
  source      = "../RandomPassword"
  count       = var.administrator_password == null ? 1 : 0
  length      = var.length
  lower       = var.lower
  min_lower   = var.min_lower
  min_numeric = var.min_numeric
  min_special = var.min_special
  min_upper   = var.min_upper
  numeric     = var.numeric
  special     = var.special
  upper       = var.upper
}

resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
  admin_password        = coalesce(var.administrator_password, module.password[0].result)
  admin_username        = var.admin_username
  location              = var.location
  name                  = var.name
  network_interface_ids = var.network_interface_ids

  os_disk {
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

  resource_group_name = var.resource_group_name
  size                = var.size

  dynamic "additional_capabilities" {
    for_each = var.additional_capabilities_block[*]
    content {
      ultra_ssd_enabled = additional_capabilities.value.ultra_ssd_enabled
    }
  }

  dynamic "additional_unattend_content" {
    for_each = var.additional_unattend_content_block[*]
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
  enable_automatic_updates      = var.enable_automatic_updates
  encryption_at_host_enabled    = var.encryption_at_host_enabled
  eviction_policy               = var.eviction_policy
  extensions_time_budget        = var.extensions_time_budget

  dynamic "gallery_application" {
    for_each = var.gallery_application_block[*]
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

  source_image_reference {
    offer     = var.offer
    publisher = var.publisher
    sku       = var.sku
    version   = var.image_reference_version
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
    for_each = var.winrm_listener_block
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

module "AADLoginForWindows" {
  count                      = var.aaDLoginForWindows == true ? 1 : 0
  source                     = "../VirtualMachineExtension"
  name                       = var.aaDLoginForWindows_name
  publisher                  = var.aaDLoginForWindows_publisher
  type                       = var.aaDLoginForWindows_type
  auto_upgrade_minor_version = var.auto_upgrade_minor_version
  type_handler_version       = var.type_handler_version
  virtual_machine_id         = azurerm_windows_virtual_machine.windows_virtual_machine.id
  depends_on                 = [
    azurerm_windows_virtual_machine.windows_virtual_machine
  ]
}

module "kv_access_policy" {
  source                  = "../KeyVaultAccessPolicy"
  count                   = var.key_vault_id == null ? 0 : 1
  key_vault_id            = var.key_vault_id
  object_id               = var.object_id
  tenant_id               = var.tenant_id
  certificate_permissions = var.certificate_permissions
  key_permissions         = var.key_permissions
  secret_permissions      = var.secret_permissions
  storage_permissions     = var.storage_permissions
  depends_on              = [
    azurerm_windows_virtual_machine.windows_virtual_machine
  ]
}

module "kv_secret_admin_username" {
  source       = "../KeyVaultSecret"
  count        = var.key_vault_id == null ? 0 : 1
  key_vault_id = var.key_vault_id
  name         = "win-vm-adm-username"
  value        = var.administrator_username
  depends_on   = [
    module.kv_access_policy
  ]
}

module "kv_secret_admin_password" {
  source       = "../KeyVaultSecret"
  count        = var.key_vault_id == null ? 0 : 1
  key_vault_id = var.key_vault_id
  name         = "win-vm-adm-password"
  value        = coalesce(var.administrator_password, module.password[0].result)
  depends_on   = [
    module.kv_access_policy
  ]
}