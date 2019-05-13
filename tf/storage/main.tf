
provider "azurerm" {
  client_id = ""
  client_secret = ""
  subscription_id = ""
  tenant_id = ""
}


#deploying storage account 
resource "azurerm_storage_account" "web_server_storage" {
  name                          = "${var.app}${var.envr}${var.suffixsto}"
  location                      = "${var.azurerm_resource_group_location}"
  resource_group_name           = "${var.app}-${var.envr}-${var.rgn}-${var.suffix}"
  account_tier             = "${var.azurerm_storage_account_actier}"
  account_replication_type = "${var.azurerm_storage_account_replication_type}"
  account_kind              = "${var.azurerm_storage_account_kind}"
  access_tier       = "${var.azurerm_storage_account_access_tier}"
  count =  "${var.PROVISION_STORAGE_ACCOUNT? 1:0}"
  enable_https_traffic_only= "${var.azurerm_storage_account_https_traffic}"
  enable_file_encryption= "${var.azurerm_storage_account_enable_file_encryption}"
  
  identity {
    type = "SystemAssigned"
  }
  tags {
    

  }

}

resource "azurerm_storage_container" "storage_container_1" {
  count =  "${var.containers}"
  name = "${element(var.azurerm_storage_container_name,count.index)}"
  resource_group_name             = "${var.app}-${var.envr}-${var.rgn}-${var.suffix}"
  storage_account_name            = "${azurerm_storage_account.web_server_storage.name}"
  container_access_type           = "${element(var.azurerm_storage_container_container_access_type,count.index)}"
  depends_on = ["azurerm_storage_account.web_server_storage"] 

}