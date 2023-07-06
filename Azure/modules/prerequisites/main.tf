module "da_projektet_tf_rg" {
  source              = "../modules/ResourceGroup"
  resource_group_name = var.rg_name
  location            = var.location
  tags                = var.tags
}

module "da_projektet_tf_sa" {
  source                          = "../modules/StorageAccount"
  storage_account_name            = var.sa_name
  resource_group_name             = module.da_projektet_tf_rg.name
  location                        = module.da_projektet_tf_rg.location
  public_network_access_enabled   = var.public_network_access_enabled
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  tags                            = var.tags
}

module "da_projektet_tf_co" {
  source                 = "../modules/StorageContainer"
  for_each               = local.names
  storage_container_name = each.key
  storage_account_name   = module.da_projektet_tf_sa.name
  container_access_type  = var.container_access_type
}