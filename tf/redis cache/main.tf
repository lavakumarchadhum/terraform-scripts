provider "azurerm" {
  client_id = ""
  client_secret = ""
  subscription_id = ""
  tenant_id = ""
}
resource "azurerm_resource_group" "3m-lavatest" {
  name     = "3mlavatest"
  location = "${var.location}"
}

resource "azurerm_storage_account" "3m-test" {
  name                     = "3mlavatest"
  resource_group_name      = "${azurerm_resource_group.3m-lavatest.name}"
  location                 = "${azurerm_resource_group.3m-lavatest.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

# NOTE: the Name used for Redis needs to be globally unique
resource "azurerm_redis_cache" "lavtest" {
  name                     = "3mlavatest"
  location            = "${azurerm_resource_group.3m-lavatest.location}"
  resource_group_name = "${azurerm_resource_group.3m-lavatest.name}"
  capacity            = 0
  family              = "C"
  sku_name            = "Basic"
  enable_non_ssl_port = false

  redis_configuration {
  }
}