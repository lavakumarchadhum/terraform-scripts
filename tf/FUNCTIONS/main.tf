# Configure the Azure provider
provider "azurerm" {
  client_id = ""
  client_secret = ""
  subscription_id = ""
  tenant_id = ""
}
resource "azurerm_resource_group" "test" {
    name = "3mtest"
    location = "East US"
}
resource "azurerm_storage_account" "test" {
  name                     = "functionsapplavatest"
  resource_group_name      = "${azurerm_resource_group.test.name}"
  location                 = "${azurerm_resource_group.test.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_app_service_plan" "test" {
  name                = "azure-functions-test-service-plan"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "test" {
  name                      = "lavatest3m"
  location                  = "${azurerm_resource_group.test.location}"
  resource_group_name       = "${azurerm_resource_group.test.name}"
  app_service_plan_id       = "${azurerm_app_service_plan.test.id}"
  storage_connection_string = "${azurerm_storage_account.test.primary_connection_string}"
}