resource "azurerm_shared_image_gallery" "shared_image_gallery" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  description         = var.description

  dynamic "sharing" {
    for_each = var.sharing_block[*]
    content {
      permission = sharing.value.permission
      dynamic "community_gallery" {
        for_each = sharing.value.community_gallery_block[*]
        content {
          eula            = community_gallery.value.eula
          prefix          = community_gallery.value.prefix
          publisher_email = community_gallery.value.publisher_email
          publisher_uri   = community_gallery.value.publisher_uri
        }
      }
    }
  }

  tags = var.tags

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
