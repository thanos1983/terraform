module "password" {
  source      = "../../../TerraformSharedModules/modules/RandomPassword"
  count       = (var.admin_password == null && var.disable_password_authentication == false) ? 1 : 0
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
  admin_username        = var.admin_username
  location              = var.location
  license_type          = var.license_type
  name                  = var.name
  network_interface_ids = var.network_interface_ids

  dynamic "os_disk" {
    for_each = var.os_disk_block[*]
    content {
      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type
      dynamic "diff_disk_settings" {
        for_each = os_disk.value.diff_disk_settings_block[*]
        content {
          option    = diff_disk_settings.value.option
          placement = diff_disk_settings.value.placement
        }
      }
      disk_encryption_set_id           = os_disk.value.disk_encryption_set_id
      disk_size_gb                     = os_disk.value.disk_size_gb
      name                             = os_disk.value.name
      secure_vm_disk_encryption_set_id = os_disk.value.secure_vm_disk_encryption_set_id
      security_encryption_type         = os_disk.value.security_encryption_type
      write_accelerator_enabled        = os_disk.value.write_accelerator_enabled
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

  admin_password = (var.admin_password == null && var.disable_password_authentication == false) ? module.password[0].result : var.admin_password

  dynamic "admin_ssh_key" {
    for_each = var.admin_ssh_key_blocks
    content {
      public_key = admin_ssh_key.value.public_key
      username   = admin_ssh_key.value.username
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

  capacity_reservation_group_id   = var.capacity_reservation_group_id
  computer_name                   = var.computer_name
  custom_data                     = var.custom_data
  dedicated_host_id               = var.dedicated_host_id
  dedicated_host_group_id         = var.dedicated_host_group_id
  disable_password_authentication = var.disable_password_authentication
  disk_controller_type            = var.disk_controller_type
  edge_zone                       = var.edge_zone
  encryption_at_host_enabled      = var.encryption_at_host_enabled
  eviction_policy                 = var.eviction_policy
  extensions_time_budget          = var.extensions_time_budget

  dynamic "gallery_application" {
    for_each = var.gallery_application_blocks
    content {
      version_id             = gallery_application.value.version_id
      configuration_blob_uri = gallery_application.value.configuration_blob_uri
      order                  = gallery_application.value.order
      tag                    = gallery_application.value.tag
    }
  }

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

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
    for_each = var.secret_blocks
    content {
      dynamic "certificate" {
        for_each = secret.value.certificate_blocks
        content {
          url = certificate.value.url
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

  user_data                    = var.user_data
  virtual_machine_scale_set_id = var.virtual_machine_scale_set_id
  vtpm_enabled                 = var.vtpm_enabled
  zone                         = var.zone

  lifecycle {
    ignore_changes = [
      admin_ssh_key
    ]
  }

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

module "addSSHLoginForLinux" {
  source                     = "../VirtualMachineExtension"
  count                      = var.aaDSSHLoginForLinux == false ? 0 : 1
  name                       = var.aaDSSHLoginForLinux_name
  publisher                  = var.aaDSSHLoginForLinux_publisher
  type                       = var.aaDSSHLoginForLinux_type
  auto_upgrade_minor_version = var.auto_upgrade_minor_version
  type_handler_version       = var.type_handler_version
  virtual_machine_id         = azurerm_linux_virtual_machine.linux_virtual_machine.id
  depends_on = [
    azurerm_linux_virtual_machine.linux_virtual_machine
  ]
}

module "kv_access_policy" {
  source             = "../KeyVaultAccessPolicy"
  count              = var.secret_permissions == [] ? 0 : length(var.secret_permissions)
  key_vault_id       = var.key_vault_id
  secret_permissions = var.secret_permissions
  object_id          = data.azurerm_client_config.cognitive_account.object_id
  tenant_id          = data.azurerm_client_config.cognitive_account.tenant_id
  application_id     = data.azurerm_client_config.cognitive_account.object_id
}

# Create RBAC permissions for KV based on name(s)
module "kv_role_assignment_names" {
  source               = "../RoleAssignment"
  count                = var.role_definition_names == [] ? 0 : length(var.role_definition_names)
  name                 = var.role_assignment_name
  role_definition_name = var.role_definition_names[count.index]
  scope                = azurerm_linux_virtual_machine.linux_virtual_machine.id
  principal_id         = var.principal_id == null ? azurerm_linux_virtual_machine.linux_virtual_machine.identity.0.principal_id : var.principal_id
}

# Create RBAC permissions for KV based on id(s)
module "kv_role_assignment_ids" {
  source               = "../RoleAssignment"
  count                = var.role_definition_ids == [] ? 0 : length(var.role_definition_ids)
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
  depends_on = [
    module.kv_access_policy, module.kv_role_assignment_ids, module.kv_role_assignment_names
  ]
}

module "kv_secret_admin_password" {
  source       = "../KeyVaultSecret"
  count        = length(concat(var.secret_permissions, var.role_definition_names, var.role_definition_ids)) == 0 ? 0 : 1
  tags         = var.tags
  key_vault_id = var.key_vault_id
  name         = "linux-${var.name}-vm-adm-password"
  value        = coalesce(var.admin_password, module.password[0].result)
  depends_on = [
    module.kv_access_policy, module.kv_role_assignment_ids, module.kv_role_assignment_names
  ]
}
