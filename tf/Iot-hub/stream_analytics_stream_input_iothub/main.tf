# Configure the Azure provider
provider "azurerm" {
  client_id = ""
  client_secret = ""
  subscription_id = ""
  tenant_id = ""
}
resource "azurerm_resource_group" "test" {
  name     = "rg1"
  location = "West US"
}

resource "azurerm_iothub" "test" {
  name                = "3mdevtest"
  resource_group_name = "${azurerm_resource_group.test.name}"
  location            = "${azurerm_resource_group.test.location}"

  sku {
    name     = "S1"
    tier     = "Standard"
    capacity = "1"
  }

  tags = {
    purpose = "testing"
  }
}

resource "azurerm_iothub_consumer_group" "test" {
  name                   = "terraformresourcetest"
  iothub_name            = "${azurerm_iothub.test.name}"
  eventhub_endpoint_name = "events"
  resource_group_name    = "${azurerm_resource_group.test.name}"
}