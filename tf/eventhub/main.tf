provider "azurerm" {
  client_id = ""
  client_secret = ""
  subscription_id = ""
  tenant_id = ""
}
resource "azurerm_resource_group" "test" {
  name     = "rg1"
  location = "east us"
}

resource "azurerm_eventhub_namespace" "test" {
  name                = "mtest1"
  location            = "east US"
  resource_group_name = "${azurerm_resource_group.test.name}"
  sku                 = "Basic"
  capacity            = 2

  tags = {
   
  }
}

resource "azurerm_eventhub" "test" {
  name                = "meventhub"
  namespace_name      = "${azurerm_eventhub_namespace.test.name}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  partition_count     = 2
  message_retention   = 1
}
resource "azurerm_eventhub_authorization_rule" "test" {
  name                = "mtest2"
  namespace_name      = "${azurerm_eventhub_namespace.test.name}"
  eventhub_name       = "${azurerm_eventhub.test.name}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  listen              = true
  send                = false
  manage              = false
}