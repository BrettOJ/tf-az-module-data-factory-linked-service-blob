resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "southeastasia"
}

data "azurerm_client_config" "current" {
}

resource "azurerm_data_factory" "test" {
  name                = "konjur-test-adf"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_key_vault" "test" {
  name                = "example"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}

module "azure_data_factory_akv_link" {
  source = "../"

  data_factory_akv_link = {
    example_linked_service = {
      name                = "exampleKeyVaultLinkedService"
      data_factory_id   = azurerm_data_factory.test.id
      key_vault_id        = azurerm_key_vault.test.id
    }
  }
}

module "azure_data_factory_blob_connection_string_link" {
  source = "../"

  data_factory_blob_connection_string_link = {
    "first_blob_service" = {
      name              = "firstBlobService"
      data_factory_id   = azurerm_data_factory.test.id
      connection_string = "DefaultEndpointsProtocol=https;AccountName=example;AccountKey=example;EndpointSuffix=core.windows.net"
    }
  }
}

module "azure_blob_storage_link" {
  source = "../"

  data_factory_blob_sas_uri_link = {
    "first_blob_sas_service" = {
      name              = "first_Blob_Sas_Service"
      data_factory_id   = azurerm_data_factory.test.id
      sas_uri           = "https://example.blob.core.windows.net/?sas-token"
      key_vault_sas_token = [
        {
          linked_service_name = module.azure_data_factory_akv_link.adf_linked_service_key_vault_out.example_linked_service.name
          secret_name         = "exampleSasTokenSecret"
        }
      ]
    }
  }
}

module "azurerm_data_factory_linked_service_azure_blob_storage" {
  source = "../"
  data_factory_blob_sevice_principal_link = {
  "first_sp_service" = {
      name            = "service_principal_blob_storage"
      data_factory_id = azurerm_data_factory.test.id
      service_endpoint     = "https://example.blob.core.windows.net"
      service_principal_id = "00000000-0000-0000-0000-000000000000"
      tenant_id            = "00000000-0000-0000-0000-000000000000"
      service_principal_linked_key_vault_key = [
        {
        linked_service_name = module.azure_data_factory_akv_link.adf_linked_service_key_vault_out.example_linked_service.name
        secret_name         = "secret"
        }
      ]      
      }
    }
  }

