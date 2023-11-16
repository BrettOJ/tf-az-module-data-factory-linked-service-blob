
# Azure Data Factory Key Vault Linked Service
resource "azurerm_data_factory_linked_service_key_vault" "df_akv_link" {
  for_each = var.data_factory_akv_link

  name                = each.value.name
  data_factory_id     = each.value.data_factory_id
  key_vault_id        = each.value.key_vault_id
}

# Azure Data Factory Linked Service Azure Blob Storage connectionm string
resource "azurerm_data_factory_linked_service_azure_blob_storage" "blob_storage_connection_string" {
  for_each = var.data_factory_blob_connection_string_link

  name              = each.value.name
  data_factory_id   = each.value.data_factory_id
  connection_string = each.value.connection_string
}


# Azure Blob Storage Linked Service sas uri
resource "azurerm_data_factory_linked_service_azure_blob_storage" "blob_storage_sas_uri" {
  for_each = var.data_factory_blob_sas_uri_link

  name              = each.value.name
  data_factory_id   = each.value.data_factory_id
  sas_uri           = each.value.sas_uri

  dynamic "key_vault_sas_token" {
    for_each = each.value.key_vault_sas_token
    content {
      linked_service_name = key_vault_sas_token.value.linked_service_name
      secret_name         = key_vault_sas_token.value.secret_name
    }
  }
}


resource "azurerm_data_factory_linked_service_azure_blob_storage" "blob_storage_sp" {
  for_each = var.data_factory_blob_sevice_principal_link

  name            = each.value.name
  data_factory_id = each.value.data_factory_id
  service_endpoint     = each.value.service_endpoint
  service_principal_id = each.value.service_principal_id
  tenant_id            = each.value.tenant_id

  dynamic "service_principal_linked_key_vault_key" {
    for_each = each.value.service_principal_linked_key_vault_key
    content {
      linked_service_name = service_principal_linked_key_vault_key.value.linked_service_name
      secret_name         = service_principal_linked_key_vault_key.value.secret_name
    }
  }
}