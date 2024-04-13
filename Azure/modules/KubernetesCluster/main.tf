resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  name                = ""
  location            = ""
  resource_group_name = ""
  

  dynamic "default_node_pool" {
    for_each = ""
    content {}
  }

  tags = var.tags
}