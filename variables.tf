variable "data_factory_akv_link" {
  type = map(object({
    name                = string
    data_factory_id     = string
    key_vault_id        = string
  }))
  default = {}
}

variable "data_factory_blob_connection_string_link" {
  type = map(object({
    name                = string
    data_factory_id     = string
    connection_string   = string
  }))
  default = {}
  
}

variable "data_factory_blob_sas_uri_link" {
  type = map(object({
    name                = string
    data_factory_id     = string
    sas_uri             = string
    key_vault_sas_token = list(object({
      linked_service_name = string
      secret_name         = string
    }))
  }))
  default = {}
}

variable "data_factory_blob_sevice_principal_link" {
  type = map(object({
    name                = string
    data_factory_id     = string
    service_endpoint    = string
    service_principal_id = string
    tenant_id            = string
    service_principal_linked_key_vault_key = list(object({
      linked_service_name = string
      secret_name         = string
    }))
  }))
  default = {}
  
}


/*

variable "data_factory_akv_link" {
  description = "The Key Vault ID in which to associate the Linked Service with. Changing this forces a new resource."
  type        = map({
    name = string
    data_factory_id = string
    key_vault_id    = string
  })
  default     = null
}

variable "name" {
  description = "Specifies the name of the Data Factory Linked Service. Changing this forces a new resource to be created. Must be unique within a data factory. See the Microsoft documentation for all restrictions."
  type        = string
}

variable "data_factory_id" {
  description = "The Data Factory ID in which to associate the Linked Service with. Changing this forces a new resource."
  type        = string
}

variable "key_vault_id" {
  description = "The Key Vault ID in which to associate the Linked Service with. Changing this forces a new resource."
  type        = string  
}

vari


variable "name" {
  description = "Specifies the name of the Data Factory Linked Service. Changing this forces a new resource to be created. Must be unique within a data factory. See the Microsoft documentation for all restrictions."
  type        = string
}

variable "data_factory_id" {
  description = "The Data Factory ID in which to associate the Linked Service with. Changing this forces a new resource."
  type        = string
}

variable "description" {
  description = "The description for the Data Factory Linked Service."
  type        = string
  default     = null
}

variable "integration_runtime_name" {
  description = "The integration runtime reference to associate with the Data Factory Linked Service."
  type        = string
  default     = null
}

variable "annotations" {
  description = "List of tags that can be used for describing the Data Factory Linked Service."
  type        = list(string)
  default     = []
}

variable "parameters" {
  description = "A map of parameters to associate with the Data Factory Linked Service."
  type        = map(string)
  default     = {}
}

variable "additional_properties" {
  description = "A map of additional properties to associate with the Data Factory Linked Service."
  type        = map(string)
  default     = {}
}

variable "connection_string" {
  description = "The connection string. Conflicts with connection_string_insecure, sas_uri and service_endpoint."
  type        = string
  default     = null
}

variable "connection_string_insecure" {
  description = "The connection string sent insecurely. Conflicts with connection_string, sas_uri and service_endpoint."
  type        = string
  default     = null
}

variable "sas_uri" {
  description = "The SAS URI. Conflicts with connection_string_insecure, connection_string and service_endpoint."
  type        = string
  default     = null
}

variable "key_vault_sas_token" {
  description = "A key_vault_sas_token block as defined below. Use this argument to store SAS Token in an existing Key Vault. It needs an existing Key Vault Data Factory Linked Service. A sas_uri is required."
  type        = list(object({
    linked_service_name = string
    secret_name         = string
  }))
  default     = []
}

variable "service_endpoint" {
  description = "The Service Endpoint. Conflicts with connection_string, connection_string_insecure and sas_uri."
  type        = string
  default     = null
}

variable "use_managed_identity" {
  description = "Whether to use the Data Factory's managed identity to authenticate against the Azure Blob Storage account. Incompatible with service_principal_id and service_principal_key."
  type        = bool
  default     = false
}

variable "service_principal_id" {
  description = "The Service Principal ID. Conflicts with use_managed_identity."
  type        = string
  default     = null
}

variable "service_principal_key" {
  description = "The Service Principal Key. Conflicts with use_managed_identity."
  type        = string
  default     = null
}

variable "service_principal_linked_key_vault_key" {
  description = "A service_principal_linked_key_vault_key block as defined below. Use this argument to store Service Principal key in an existing Key Vault. It needs an existing Key Vault Data Factory Linked Service."
  type        = list(object({
    linked_service_name = string
    secret_name         = string
  }))
  default     = []
}

variable "tenant_id" {
  description = "The Tenant ID. Conflicts with use_managed_identity."
  type        = string
  default     = null
}

variable "storage_kind" {
  description = "The Storage Kind. Possible values are BlobStorage and FileStorage."
  type        = string
  default     = "BlobStorage"
}

*/
