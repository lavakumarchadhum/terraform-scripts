provider "azurerm" {
  client_id = ""
  client_secret = ""
  subscription_id = ""
  tenant_id = ""
}
resource "azurerm_resource_group" "test" {
  name     = "resourceGroup1"
  location = "West US 2"
}

resource "azurerm_eventgrid_domain" "test" {
  name                = "my-eventgrid-domain"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"

  tags = {
    environment = "Production"
  }
}