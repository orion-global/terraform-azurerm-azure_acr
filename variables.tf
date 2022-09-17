#------------------------------------------------------------------------------------------
# Action variables
#------------------------------------------------------------------------------------------

variable "create_resource_group" {
  description = "Action for creation or not of the resource group"
  type        = bool
  default     = false
}

#------------------------------------------------------------------------------------------
# Information variables
#------------------------------------------------------------------------------------------

variable "registry_name" {
  description = "(Required) Specifies the name of the Container Registry. Only Alphanumeric characters allowed. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "sku" {
  description = "(Required) The SKU name of the container registry. Possible values are Basic, Standard and Premium, by default it is set to Basic."
  type        = string
  default     = "Basic"
}

variable "enable_admin" {
  description = "(Optional) Specifies whether the admin user is enabled. Defaults to false."
  type        = bool
  default     = null
}

variable "enable_public_access" {
  description = "(Optional) Whether public network access is allowed for the container registry. Defaults to true."
  type        = bool
  default     = null
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "location_name" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

#------------------------------------------------------------------------------------------
# Premium SKU Only variables
#------------------------------------------------------------------------------------------

variable "enable_quarantine_policy" {
  description = "(Optional) Boolean value that indicates whether quarantine policy is enabled. Defaults to false."
  type        = bool
  default     = null
}

variable "enable_export_policy" {
  description = "(Optional) Boolean value that indicates whether export policy is enabled. Defaults to true. In order to set it to false, make sure the public_network_access_enabled is also set to false."
  type        = bool
  default     = null
}

variable "enable_zone_redundancy" {
  description = "(Optional) Whether zone redundancy is enabled for this Container Registry? Changing this forces a new resource to be created. Defaults to false."
  type        = bool
  default     = null
}

variable "enable_trust_policy" {
  description = "(Optional) Boolean value that indicates whether the policy is enabled."
  type        = bool
  default     = null
}

variable "retention_policy" {
  description = "DNS policy setup for the VPC."
  type = object({
    enabled = bool
    days    = number
  })
  default = null
}