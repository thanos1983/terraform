resource "sysdig_secure_posture_policy" "secure_posture_policy" {
  name             = var.name
  description      = var.description
  link             = var.link
  type             = var.type
  platform         = var.platform
  min_kube_version = var.minKubeVersion
  max_kube_version = var.maxKubeVersion

  dynamic "target" {
    for_each = var.target_block[*]
    content {
      platform    = target.value.platform
      min_version = target.value.minVersion
      max_version = target.value.maxVersion
    }
  }

  dynamic "group" {
    for_each = var.group_blocks
    content {
      name        = group.value.name
      description = group.value.description
      dynamic "requirement" {
        for_each = group.value.requirement_block[*]
        content {
          description = requirement.value.description
          name        = requirement.value.description
          dynamic "control" {
            for_each = requirement.value.control_blocks
            content {
              name    = control.value.name
              enabled = control.value.enabled
            }
          }
        }
      }
    }
  }
}