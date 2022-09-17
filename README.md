# Repositorio plantilla para la creación de nuevos módulos de Terraform
Este repositorio tiene como finalidad, guiar en el proceso de creación de un nuevo módulo de Terraform, brindando indicaciones así como la estructura de archivos y carpetas que se deben contener para una correcta conexión y funcionalidad.

## Uso e instalación
Para la instalación deberá conectarse el repositorio con el registro privado de la organización de Terraform Cloud. Para ello deberá tenerse las siguientes consideraciones:
* Usar esta plantilla para la estructura de archivos
  * El repositorio en si mismo es el módulo.
  * En caso emplee submódulos, estos ebdeberán cargarse en la carpeta submodules y cada uno contará con sus respectivos ejemplos.
* Eliminar toda la información de guía desde la línea separadora hacia arriba, lo podrá identificar con el comentario "INICIO DE PLANTILLA DE DOCUMENTACIÓN" en el contenido del archivo Markdown.
* El repositorio deberá tener la siguiente estructura en el nombre:
  * terraform-_proveedor_-_nombre que se le dará al módulo sin guiones_
* Para que sea funcional, deberá generar un nuevo _release_ usando _tags_ en Github
  * Use [versiones de tipo semántica](https://semver.org/), por ejemplo: v1.0.0
  * Para ello, ir a la página de _releases_ del repositorio ubicado en "/releases/new" y crear un nuevo _tag_
    * Para nuevas versiones, siga la secuencia lógica de las versiones, por ejemplo: v1.0.0 > v1.0.1
    * En el campo de título, el nombre del tag, por ejemplo: v1.0.0
    * En el campo de descripción, indique los detalles de la nueva versión y los cambios efectuados.

<!-- INICIO DE PLANTILLA DE DOCUMENTACIÓN -->

# _Insertar el nombre del módulo_
Agregar breve descripción del módulo y los recursos que creará.

## Usage

```hcl
Agregar el uso del módulo
```

## Examples

- [Ejemplo 01](https://github.com/orion-global/terraform-module-template/tree/prod/examples/example-001): Este es un primer ejemplo

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
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
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
| <a name="output_permutation_string_list"></a> [permutation\_string\_list](#output\_permutation\_string\_list) | n/a |

## License

MIT Licensed. See [LICENSE](https://github.com/orion-global/terraform-module-template/tree/prod/LICENSE) for full details.