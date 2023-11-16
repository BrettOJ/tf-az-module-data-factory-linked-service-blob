Manages a Linked Service (connection) between Key Vault and Azure Data Factory.

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#example-usage)

```
data "azurerm_client_config" "current" {
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_key_vault" "example" {
  name                = "example"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}

resource "azurerm_data_factory" "example" {
  name                = "example"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_data_factory_linked_service_key_vault" "example" {
  name            = "example"
  data_factory_id = azurerm_data_factory.example.id
  key_vault_id    = azurerm_key_vault.example.id
}
```

## [Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#argument-reference)

The following arguments are supported:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#name) - (Required) Specifies the name of the Data Factory Linked Service Key Vault. Changing this forces a new resource to be created. Must be unique within a data factory. See the [Microsoft documentation](https://docs.microsoft.com/azure/data-factory/naming-rules) for all restrictions.
    
-   [`data_factory_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#data_factory_id) - (Required) The Data Factory ID in which to associate the Linked Service with. Changing this forces a new resource.
    
-   [`key_vault_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#key_vault_id) - (Required) The ID the Azure Key Vault resource.
    
-   [`description`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#description) - (Optional) The description for the Data Factory Linked Service Key Vault.
    
-   [`integration_runtime_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#integration_runtime_name) - (Optional) The integration runtime reference to associate with the Data Factory Linked Service Key Vault.
    
-   [`annotations`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#annotations) - (Optional) List of tags that can be used for describing the Data Factory Linked Service Key Vault.
    
-   [`parameters`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#parameters) - (Optional) A map of parameters to associate with the Data Factory Linked Service Key Vault.
    
-   [`additional_properties`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#additional_properties) - (Optional) A map of additional properties to associate with the Data Factory Linked Service Key Vault.
    

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#attributes-reference)

In addition to the Arguments listed above - the following Attributes are exported:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#id) - The ID of the Data Factory Key Vault Linked Service.

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:

-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#create) - (Defaults to 30 minutes) Used when creating the Data Factory Key Vault Linked Service.
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#update) - (Defaults to 30 minutes) Used when updating the Data Factory Key Vault Linked Service.
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#read) - (Defaults to 5 minutes) Used when retrieving the Data Factory Key Vault Linked Service.
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#delete) - (Defaults to 30 minutes) Used when deleting the Data Factory Key Vault Linked Service.

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#import)

Data Factory Key Vault Linked Service's can be imported using the `resource id`, e.g.

```
terraform import azurerm_data_factory_linked_service_key_vault.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.DataFactory/factories/example/linkedservices/example
```