resource "azurerm_resource_group" "resource_group" {
  count    = var.create_resource_group ? 1 : 0
  name     = var.resource_group_name
  location = var.location_name
}

data "azurerm_resource_group" "resource_group" {
  count = var.create_resource_group ? 0 : 1
  name  = var.resource_group_name
}

resource "azurerm_container_registry" "acr" {
  name                          = var.registry_name
  resource_group_name           = azurerm_resource_group.resource_group[0].name
  location                      = azurerm_resource_group.resource_group[0].location
  sku                           = var.sku
  admin_enabled                 = var.enable_admin
  public_network_access_enabled = var.enable_public_access
  quarantine_policy_enabled     = var.enable_quarantine_policy
  export_policy_enabled         = var.enable_export_policy
  zone_redundancy_enabled       = var.enable_zone_redundancy
  dynamic "retention_policy" {
    for_each = toset(var.retention_policy == null ? [] : [""])
    content {
      days    = var.retention_policy.days
      enabled = var.retention_policy.enabled
    }
  }
  dynamic "trust_policy" {
    for_each = toset(var.enable_trust_policy == null ? [] : [""])
    content {
      enabled = var.enable_trust_policy
    }
  }



  /*   identity                   = "sdsd" #(Optional) An identity block as defined below.
  encryption                 = "sdsd" #(Optional) An encryption block as documented below.
  anonymous_pull_enabled     = "sdsd" #(Optional) Whether allows anonymous (unauthenticated) pull access to this Container Registry? Defaults to false. This is only supported on resources with the Standard or Premium SKU.
  data_endpoint_enabled      = "sdsd" #(Optional) Whether to enable dedicated data endpoints for this Container Registry? Defaults to false. This is only supported on resources with the Premium SKU.
  network_rule_bypass_option = "sdsd" #(Optional) Whether to allow trusted Azure services to access a network restricted Container Registry? Possible values are None and AzureServices. Defaults to AzureServices.

  tags             = "sdsd" #(Optional) A mapping of tags to assign to the resource.
  georeplications  = "sdsd" #(Optional) A georeplications block as documented below.
  network_rule_set = "sdsd" #(Optional) A network_rule_set block as documented below. */



}
