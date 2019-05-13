provider "azurerm" {
  client_id = ""
  client_secret = ""
  subscription_id = ""
  tenant_id = ""
}
resource "azurerm_resource_group" "test" {
  name     = "laav3mresources"
  location = "West Europe"
}

resource "azurerm_api_management" "test" {
  name                = "laavtest-apim"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  publisher_name      = "lkc"
  publisher_email     = "lava@lkc.com"

  sku {
    name     = "Developer"
    capacity = 1
  }
}
