# _Azure ACR Module_
Módulo para la creación de un Azure Container Registry (ACR) en Azure.

---
**NOTA**: Se tiene pendiente el desarrollo de los siguientes parámetros:
- encryption
- network_rule_set

---

## Usage

```hcl
module "module_test" {
  source                = "app.terraform.io/orion-global/azure_acr/azurerm"
  version               = "1.0.1"
  create_resource_group = true
  resource_group_name   = "temporal"
  location_name         = "East US"
  registry_name         = "registry01"
  sku                   = "Premium"

  enable_trust_policy = true
  retention_policy = {
    enabled = true
    days    = 10
  }
  replicas = {
    "East US 2" = { enable_zone_redundancy = true, enable_regional_endpoint = true }
    "West US 2" = { enable_zone_redundancy = false, enable_regional_endpoint = true }
  }

  identity_type = "SystemAssigned"
  identity_list = ["/subscriptions/XXXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/firstrg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/firstidentity"]

  tags = {
    "tempo" = "value1"
    "tag2"  = "value2"
  }
}

```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.23 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.23 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Action for creation or not of the resource group | `bool` | `false` | no |
| <a name="input_enable_admin"></a> [enable\_admin](#input\_enable\_admin) | (Optional) Specifies whether the admin user is enabled. Defaults to false. | `bool` | `null` | no |
| <a name="input_enable_anonymous_pull"></a> [enable\_anonymous\_pull](#input\_enable\_anonymous\_pull) | (Optional) Whether allows anonymous (unauthenticated) pull access to this Container Registry? Defaults to false. This is only supported on resources with the Standard or Premium SKU. | `bool` | `null` | no |
| <a name="input_enable_data_endpoint"></a> [enable\_data\_endpoint](#input\_enable\_data\_endpoint) | (Optional) Whether to enable dedicated data endpoints for this Container Registry? Defaults to false. This is only supported on resources with the Premium SKU. | `bool` | `null` | no |
| <a name="input_enable_export_policy"></a> [enable\_export\_policy](#input\_enable\_export\_policy) | (Optional) Boolean value that indicates whether export policy is enabled. Defaults to true. In order to set it to false, make sure the public\_network\_access\_enabled is also set to false. | `bool` | `null` | no |
| <a name="input_enable_public_access"></a> [enable\_public\_access](#input\_enable\_public\_access) | (Optional) Whether public network access is allowed for the container registry. Defaults to true. | `bool` | `null` | no |
| <a name="input_enable_quarantine_policy"></a> [enable\_quarantine\_policy](#input\_enable\_quarantine\_policy) | (Optional) Boolean value that indicates whether quarantine policy is enabled. Defaults to false. | `bool` | `null` | no |
| <a name="input_enable_trust_policy"></a> [enable\_trust\_policy](#input\_enable\_trust\_policy) | (Optional) Boolean value that indicates whether the policy is enabled. | `bool` | `null` | no |
| <a name="input_enable_zone_redundancy"></a> [enable\_zone\_redundancy](#input\_enable\_zone\_redundancy) | (Optional) Whether zone redundancy is enabled for this Container Registry? Changing this forces a new resource to be created. Defaults to false. | `bool` | `null` | no |
| <a name="input_identity_list"></a> [identity\_list](#input\_identity\_list) | (Opcional) Object with values of retention policy, contains boolean value that indicates whether the policy is enabled and number of days to retain. Use the format 'identifier of region' = { enable\_zone\_redundancy = true/false, enable\_regional\_endpoint = true/false} | `list(string)` | `null` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | (Optional) Identity type of the container registry. Possible values are 'SystemAssigned', 'UserAssigned' or 'Both' (Literal). | `string` | `null` | no |
| <a name="input_location_name"></a> [location\_name](#input\_location\_name) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_network_bypass"></a> [network\_bypass](#input\_network\_bypass) | (Optional) Whether to allow trusted Azure services to access a network restricted Container Registry? Possible values are None and AzureServices. Defaults to AzureServices. | `string` | `null` | no |
| <a name="input_registry_name"></a> [registry\_name](#input\_registry\_name) | (Required) Specifies the name of the Container Registry. Only Alphanumeric characters allowed. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | (Opcional) Object with values of retention policy, contains boolean value that indicates whether the policy is enabled and number of days to retain. Use the format 'identifier of region' = { enable\_zone\_redundancy = true/false, enable\_regional\_endpoint = true/false} | <pre>map(object({<br>    enable_zone_redundancy   = bool<br>    enable_regional_endpoint = bool<br>  }))</pre> | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_retention_policy"></a> [retention\_policy](#input\_retention\_policy) | (Opcional) Object with values of retention policy, contains boolean value that indicates whether the policy is enabled and number of days to retain. | <pre>object({<br>    enabled = bool<br>    days    = number<br>  })</pre> | `null` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | (Required) The SKU name of the container registry. Possible values are Basic, Standard and Premium, by default it is set to Basic. | `string` | `"Basic"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. Use the map of {tag = value} format. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | n/a |
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | n/a |
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | n/a |
| <a name="output_registry_name"></a> [registry\_name](#output\_registry\_name) | n/a |
<!-- END_TF_DOCS -->

## License

MIT Licensed. See [LICENSE](https://github.com/orion-global/terraform-module-template/tree/prod/LICENSE) for full details.