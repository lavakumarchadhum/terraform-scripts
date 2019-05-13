
provider "azurerm" {
  client_id = "5483979a-7f59-4bc3-88f7-d51c02e99871"
  client_secret = "113cd6e6-0245-47a4-a1be-603c36b9e1da"
  subscription_id = "21500eca-7a48-4440-9881-ad9627650c0d"
  tenant_id = "d4e93350-655a-4ddf-bb95-9a244e4256a7"
}
resource "azurerm_resource_group" "default" {
    name = "3mtest"
    location = "East US"
}
resource "azurerm_app_service_plan" "default" {
  name                = "3mtestwebappdev"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"                                                                                                                                        
  sku {
        tier = "Standard"
        size = "S1"
    }
}
resource "azurerm_app_service" "default" {
    name                = "3mtestwebappdev"
    location            = "${azurerm_resource_group.default.location}"
    resource_group_name = "${azurerm_resource_group.default.name}"
    app_service_plan_id = "${azurerm_app_service_plan.default.id}"
}
resource "azurerm_app_service_slot" "default" {
    name                = "3mtestwebappdev"
    location            = "${azurerm_resource_group.default.location}"
    resource_group_name = "${azurerm_resource_group.default.name}"
    app_service_plan_id = "${azurerm_app_service_plan.default.id}"
    app_service_name    = "${azurerm_app_service.default.name}"
}