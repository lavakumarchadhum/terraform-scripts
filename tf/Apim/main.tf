provider "azurerm" {
  client_id = "5483979a-7f59-4bc3-88f7-d51c02e99871"
  client_secret = "113cd6e6-0245-47a4-a1be-603c36b9e1da"
  subscription_id = "21500eca-7a48-4440-9881-ad9627650c0d"
  tenant_id = "d4e93350-655a-4ddf-bb95-9a244e4256a7"
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