provider "azurerm" {
  client_id = ""
  client_secret = ""
  subscription_id = ""
  tenant_id = ""
}
resource "azurerm_resource_group" "test" {
  name     = "acceptanceTestResourceGroupn"
  location = "West US"
}

resource "azurerm_sql_server" "test" {
  name                         = "mysqlserverpl"
  resource_group_name          = "${azurerm_resource_group.test.name}"
  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "lavakuamrch"
  administrator_login_password = "Pineapple2019"
}

resource "azurerm_sql_database" "test" {
  name                = "mysqldatabasen"
  resource_group_name = "${azurerm_resource_group.test.name}"
  location            = "West US"
  server_name         = "${azurerm_sql_server.test.name}"

  tags = {
    environment = "production"
  }
}