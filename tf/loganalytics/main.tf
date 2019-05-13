provider "azurerm" {
  client_id = ""
  client_secret = ""
  subscription_id = ""
  tenant_id = ""
}
resource "azurerm_resource_group" "example" {
  name     = "lavatest"
  location = "${var.location}"
}

resource "azurerm_log_analytics_workspace" "example" {
  name                = "lavaworkspace"
  location            = "${azurerm_resource_group.example.location}"
  resource_group_name = "${azurerm_resource_group.example.name}"
  sku                 = "PerGB2018"
}