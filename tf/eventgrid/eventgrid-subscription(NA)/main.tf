provider "azurerm" {
  client_id = ""
  client_secret = ""
  subscription_id = ""
  tenant_id = ""
}
resource "azurerm_resource_group" "default" {
  name     = "lavtest"
  location = "east us"
}

resource "azurerm_storage_account" "default" {
    name                     = "lavamtest"
    resource_group_name      = "${azurerm_resource_group.default.name}"
    location                 = "${azurerm_resource_group.default.location}"
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
      environment = "staging"
    }
  }
  resource "azurerm_storage_queue" "default" {
    name                 = "lavamtest"
    resource_group_name  = "${azurerm_resource_group.default.name}"
    storage_account_name = "${azurerm_storage_account.default.name}"
  }
resource "azurerm_eventgrid_event_subscription" "default" {
  name  = "lavamteste"
  scope = "${azurerm_resource_group.default.id}"
  storage_queue_endpoint {
      storage_account_id = "${azurerm_storage_account.default.id}"
      queue_name         = "${azurerm_storage_queue.default.name}"
  }
}