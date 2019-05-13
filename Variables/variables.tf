

# ENVIRONMENT IN WHICH THE RESOURCES ARE TO BE CREATED
variable "envr" {
  default = ""
}

# AZURE REGION IN WHICH THE RESOURCES ARE TO BE CREATED
variable "rgn" {
  default = ""
}

# THE APPLICATION NAME WHICH WILL USE ALL THESE RESOURCES
variable "app" {
  default = ""
}


variable "azurerm_resource_group_location"{
  default = ""
}

variable "suffix"{
default = ""
}
variable "suffixsto"{
  default = ""
}



#VARIABLES FOR ADDITIONAL TAGS



# USER CHOICE TO PROVISION STORAGE_ACCOUNT DURING THE CURRENT RUN OF THIS SCRIPT
# TRUE => PROVISION THE RESOURCES FALSE => SKIP THE PROVISIONING OF THE RESOURCE
variable "PROVISION_STORAGE_ACCOUNT" {
  default = false
}






# VARIABLES USED IN STORAGE


variable "azurerm_storage_account_enable_file_encryption"{
    default = ""
}
variable "azurerm_storage_container_name"{
type="list"
}

variable "containers"{
  default = ""
}



variable "azurerm_storage_account_actier" {
  default = ""
}
variable "azurerm_storage_account_replication_type" {
  default = ""
}
variable "azurerm_storage_account_kind" {
  default = ""
}
variable "azurerm_storage_account_access_tier" {
  default = ""
}
variable "azurerm_storage_account_https_traffic" {
  default = ""
}
variable "azurerm_storage_container_container_access_type" {
  type="list"
}



