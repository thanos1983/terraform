module "password" {
  source      = "../RandomPassword"
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

resource "azurerm_linux_virtual_machine_scale_set" "linux_virtual_machine_scale_set" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  admin_username      = var.admin_username
  instances           = var.instances
  sku                 = var.sku

  dynamic "network_interface" {
    for_each = var.network_interface_blocks
    content {
      name = network_interface.value.name
      dynamic "ip_configuration" {
        for_each = network_interface.value.ip_configuration_blocks
        content {
          name                                         = ip_configuration.value.name
          application_gateway_backend_address_pool_ids = ip_configuration.value.application_gateway_backend_address_pool_ids
          application_security_group_ids               = ip_configuration.value.application_security_group_ids
          load_balancer_backend_address_pool_ids       = ip_configuration.value.load_balancer_backend_address_pool_ids
          load_balancer_inbound_nat_rules_ids          = ip_configuration.value.load_balancer_inbound_nat_rules_ids
          primary                                      = ip_configuration.value.primary
          dynamic "public_ip_address" {
            for_each = ip_configuration.value.public_ip_address_block[*]
            content {
              name                    = public_ip_address.value.name
              domain_name_label       = public_ip_address.value.domain_name_label
              idle_timeout_in_minutes = public_ip_address.value.idle_timeout_in_minutes
              dynamic "ip_tag" {
                for_each = public_ip_address.value.ip_tag_block[*]
                content {
                  tag  = ip_tag.value.tag
                  type = ip_tag.value.type
                }
              }
              public_ip_prefix_id = public_ip_address.value.public_ip_prefix_id
              version             = public_ip_address.value.version
            }
          }
          subnet_id = ip_configuration.value.subnet_id
          version   = ip_configuration.value.version
        }
      }
      dns_servers                   = network_interface.value.dns_servers
      enable_accelerated_networking = network_interface.value.enable_accelerated_networking
      enable_ip_forwarding          = network_interface.value.enable_ip_forwarding
      primary                       = network_interface.value.primary
    }
  }

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
      secure_vm_disk_encryption_set_id = os_disk.value.secure_vm_disk_encryption_set_id
      security_encryption_type         = os_disk.value.security_encryption_type
      write_accelerator_enabled        = os_disk.value.write_accelerator_enabled
    }
  }

  dynamic "additional_capabilities" {
    for_each = var.additional_capabilities_block[*]
    content {
      ultra_ssd_enabled = additional_capabilities.value.ultra_ssd_enabled
    }
  }

  admin_password = (var.admin_password == null && var.disable_password_authentication == false) ?
    module.password[0].result : var.admin_password

  dynamic "admin_ssh_key" {
    for_each = var.admin_ssh_key_blocks
    content {
      public_key = admin_ssh_key.value.public_key
      username   = admin_ssh_key.value.username
    }
  }

  dynamic "automatic_os_upgrade_policy" {
    for_each = var.automatic_os_upgrade_policy_block[*]
    content {
      disable_automatic_rollback  = automatic_os_upgrade_policy.value.disable_automatic_rollback
      enable_automatic_os_upgrade = automatic_os_upgrade_policy.value.enable_automatic_os_upgrade
    }
  }

  dynamic "automatic_instance_repair" {
    for_each = var.automatic_instance_repair_block[*]
    content {
      enabled      = automatic_instance_repair.value.enabled
      grace_period = automatic_instance_repair.value.grace_period
      action       = automatic_instance_repair.value.action
    }
  }

  dynamic "boot_diagnostics" {
    for_each = var.boot_diagnostics_block[*]
    content {
      storage_account_uri = boot_diagnostics.value.storage_account_uri
    }
  }

  capacity_reservation_group_id = var.capacity_reservation_group_id
  computer_name_prefix          = var.computer_name_prefix
  custom_data                   = var.custom_data

  dynamic "data_disk" {
    for_each = var.data_disk_blocks
    content {
      name                           = data_disk.value.name
      caching                        = data_disk.value.caching
      create_option                  = data_disk.value.create_option
      disk_size_gb                   = data_disk.value.disk_size_gb
      lun                            = data_disk.value.lun
      storage_account_type           = data_disk.value.storage_account_type
      disk_encryption_set_id         = data_disk.value.disk_encryption_set_id
      ultra_ssd_disk_iops_read_write = data_disk.value.ultra_ssd_disk_iops_read_write
      ultra_ssd_disk_mbps_read_write = data_disk.value.ultra_ssd_disk_mbps_read_write
      write_accelerator_enabled      = data_disk.value.write_accelerator_enabled
    }
  }

  disable_password_authentication                   = var.disable_password_authentication
  do_not_run_extensions_on_overprovisioned_machines = var.do_not_run_extensions_on_overprovisioned_machines
  edge_zone                                         = var.edge_zone
  encryption_at_host_enabled                        = var.encryption_at_host_enabled

  dynamic "extension" {
    for_each = var.extension_blocks
    content {
      name                       = extension.value.name
      publisher                  = extension.value.publisher
      type                       = extension.value.type
      type_handler_version       = extension.value.type_handler_version
      auto_upgrade_minor_version = extension.value.auto_upgrade_minor_version
      automatic_upgrade_enabled  = extension.value.automatic_upgrade_enabled
      force_update_tag           = extension.value.force_update_tag
      protected_settings         = extension.value.protected_settings
      dynamic "protected_settings_from_key_vault" {
        for_each = extension.value.protected_settings_from_key_vault_block[*]
        content {
          secret_url      = protected_settings_from_key_vault.value.secret_url
          source_vault_id = protected_settings_from_key_vault.value.source_vault_id
        }
      }
      provision_after_extensions = extension.value.provision_after_extensions
      settings                   = extension.value.settings
    }
  }

  extension_operations_enabled = var.extension_operations_enabled
  extensions_time_budget       = var.extensions_time_budget
  eviction_policy              = var.eviction_policy

  dynamic "gallery_application" {
    for_each = var.gallery_application_blocks
    content {
      version_id             = gallery_application.value.version_id
      configuration_blob_uri = gallery_application.value.configuration_blob_uri
      order                  = gallery_application.value.order
      tag                    = gallery_application.value.tag
    }
  }

  health_probe_id = var.health_probe_id
  host_group_id   = var.host_group_id

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  max_bid_price = var.max_bid_price
  overprovision = var.overprovision

  dynamic "plan" {
    for_each = var.plan_block[*]
    content {
      name      = plan.value.name
      product   = plan.value.product
      publisher = plan.value.publisher
    }
  }

  platform_fault_domain_count  = var.platform_fault_domain_count
  priority                     = var.priority
  provision_vm_agent           = var.provision_vm_agent
  proximity_placement_group_id = var.proximity_placement_group_id

  dynamic "rolling_upgrade_policy" {
    for_each = var.rolling_upgrade_policy_block[*]
    content {
      cross_zone_upgrades_enabled             = rolling_upgrade_policy.value.cross_zone_upgrades_enabled
      max_batch_instance_percent              = rolling_upgrade_policy.value.max_batch_instance_percent
      max_unhealthy_instance_percent          = rolling_upgrade_policy.value.max_unhealthy_instance_percent
      max_unhealthy_upgraded_instance_percent = rolling_upgrade_policy.value.max_unhealthy_upgraded_instance_percent
      pause_time_between_batches              = rolling_upgrade_policy.value.pause_time_between_batches
      prioritize_unhealthy_instances_enabled  = rolling_upgrade_policy.value.prioritize_unhealthy_instances_enabled
      maximum_surge_instances_enabled         = rolling_upgrade_policy.value.maximum_surge_instances_enabled
    }
  }

  dynamic "scale_in" {
    for_each = var.scale_in_block[*]
    content {
      rule                   = scale_in.value.rule
      force_deletion_enabled = scale_in.value.force_deletion_enabled
    }
  }

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

  secure_boot_enabled    = var.secure_boot_enabled
  single_placement_group = var.single_placement_group
  source_image_id        = var.source_image_id

  dynamic "source_image_reference" {
    for_each = var.source_image_reference_block[*]
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }

  dynamic "spot_restore" {
    for_each = var.spot_restore_block[*]
    content {
      enabled = spot_restore.value.enabled
      timeout = spot_restore.value.timeout
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

  upgrade_mode = var.upgrade_mode
  user_data    = var.user_data
  vtpm_enabled = var.vtpm_enabled
  zone_balance = var.zone_balance
  zones        = var.zones

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
  principal_id         = var.principal_id == null ?
    azurerm_linux_virtual_machine.linux_virtual_machine.identity.0.principal_id : var.principal_id
}

# Create RBAC permissions for KV based on id(s)
module "kv_role_assignment_ids" {
  source               = "../RoleAssignment"
  count                = var.role_definition_ids == [] ? 0 : length(var.role_definition_ids)
  name                 = var.role_assignment_name
  role_definition_name = var.role_definition_ids[count.index]
  scope                = azurerm_linux_virtual_machine.linux_virtual_machine.id
  principal_id         = var.principal_id == null ?
    azurerm_linux_virtual_machine.linux_virtual_machine.identity.0.principal_id : var.principal_id
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
  value = coalesce(var.admin_password, module.password[0].result)
  depends_on = [
    module.kv_access_policy, module.kv_role_assignment_ids, module.kv_role_assignment_names
  ]
}