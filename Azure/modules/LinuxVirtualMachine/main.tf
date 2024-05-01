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

resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
  admin_password = coalesce(var.administrator_password, module.password[0].result)

  dynamic "admin_ssh_key" {
    for_each = var.admin_ssh_key_block[*]
    content {
      public_key = admin_ssh_key.value.public_key
      username   = admin_ssh_key.value.username
    }
  }

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
  enable_automatic_updates      = var.enable_automatic_updates
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

  dynamic "source_image_reference" {
    for_each = var.source_image_reference_block[*]
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
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

module "aaDSSHLoginForLinux" {
  source                     = "../VirtualMachineExtension"
  count                      = var.aaDSSHLoginForLinux == false ? 0 : 1
  name                       = var.aaDSSHLoginForLinux_name
  publisher                  = var.aaDSSHLoginForLinux_publisher
  type                       = var.aaDSSHLoginForLinux_type
  auto_upgrade_minor_version = var.auto_upgrade_minor_version
  type_handler_version       = var.type_handler_version
  virtual_machine_id         = azurerm_linux_virtual_machine.linux_virtual_machine.id
  depends_on                 = [
    azurerm_linux_virtual_machine.linux_virtual_machine
  ]
}

module "kv_access_policy" {
  source             = "../KeyVaultAccessPolicy"
  count              = var.secret_permissions == null ? 0 : length(var.secret_permissions)
  key_vault_id       = var.key_vault_id
  secret_permissions = var.secret_permissions
  object_id          = data.azurerm_client_config.cognitive_account.object_id
  tenant_id          = data.azurerm_client_config.cognitive_account.tenant_id
  application_id     = data.azurerm_client_config.cognitive_account.object_id
}

# Create RBAC permissions for KV based on name(s)
module "kv_role_assignment_names" {
  source               = "../RoleAssignment"
  count                = var.role_definition_names == null ? 0 : length(var.role_definition_names)
  name                 = var.role_assignment_name
  role_definition_name = var.role_definition_names[count.index]
  scope                = azurerm_linux_virtual_machine.linux_virtual_machine.id
  principal_id         = var.principal_id == null ? azurerm_linux_virtual_machine.linux_virtual_machine.identity.0.principal_id : var.principal_id
}

# Create RBAC permissions for KV based on id(s)
module "kv_role_assignment_ids" {
  source               = "../RoleAssignment"
  count                = var.role_definition_ids == null ? 0 : length(var.role_definition_ids)
  name                 = var.role_assignment_name
  role_definition_name = var.role_definition_ids[count.index]
  scope                = azurerm_linux_virtual_machine.linux_virtual_machine.id
  principal_id         = var.principal_id == null ? azurerm_linux_virtual_machine.linux_virtual_machine.identity.0.principal_id : var.principal_id
}

module "kv_secret_admin_username" {
  source       = "../KeyVaultSecret"
  count        = length(concat(var.secret_permissions, var.role_definition_names, var.role_definition_ids)) == 0 ? 0 : 1
  tags         = var.tags
  key_vault_id = var.key_vault_id
  name         = "linux-${var.name}-vm-adm-username"
  value        = var.administrator_username
  depends_on   = [
    module.kv_access_policy, module.kv_role_assignment_ids, module.kv_role_assignment_names
  ]
}

module "kv_secret_admin_password" {
  source       = "../KeyVaultSecret"
  count        = length(concat(var.secret_permissions, var.role_definition_names, var.role_definition_ids)) == 0 ? 0 : 1
  tags         = var.tags
  key_vault_id = var.key_vault_id
  name         = "linux-${var.name}-vm-adm-password"
  value        = coalesce(var.administrator_password, module.password[0].result)
  depends_on   = [
    module.kv_access_policy, module.kv_role_assignment_ids, module.kv_role_assignment_names
  ]
}