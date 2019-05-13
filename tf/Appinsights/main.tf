provider "azurerm" {
  client_id = ""
  client_secret = ""
  subscription_id = ""
  tenant_id = ""
}
resource "azurerm_resource_group" "test" {
  name     = "3mdev-test"
  location = "East us"
}

resource "azurerm_application_insights" "test" {
  name                = "tf-test-appinsights"
  location            = "East us"
  resource_group_name = "${azurerm_resource_group.test.name}"
  application_type    = "web"
}

resource "azurerm_application_insights_api_key" "read_telemetry" {
  name                    = "tf-test-appinsights-read-telemetry-api-key"
  application_insights_id = "${azurerm_application_insights.test.id}"
  read_permissions        = ["aggregate", "api", "draft", "extendqueries", "search"]
}

resource "azurerm_application_insights_api_key" "write_annotations" {
  name                    = "tf-test-appinsights-write-annotations-api-key"
  application_insights_id = "${azurerm_application_insights.test.id}"
  write_permissions       = ["annotations"]
}

resource "azurerm_application_insights_api_key" "authenticate_sdk_control_channel" {
  name                    = "tf-test-appinsights-authenticate-sdk-control-channel-api-key"
  application_insights_id = "${azurerm_application_insights.test.id}"
  read_permissions        = ["agentconfig"]
}

resource "azurerm_application_insights_api_key" "full_permissions" {
  name                    = "tf-test-appinsights-full-permissions-api-key"
  application_insights_id = "${azurerm_application_insights.test.id}"
  read_permissions        = ["agentconfig", "aggregate", "api", "draft", "extendqueries", "search"]
  write_permissions       = ["annotations"]
}

output "read_telemetry_api_key" {
  value = "${azurerm_application_insights_api_key.read_telemetry.api_key}"
}

output "write_annotations_api_key" {
  value = "${azurerm_application_insights_api_key.write_annotations.api_key}"
}

output "authenticate_sdk_control_channel" {
  value = "${azurerm_application_insights_api_key.authenticate_sdk_control_channel.api_key}"
}

output "full_permissions_api_key" {
  value = "${azurerm_application_insights_api_key.full_permissions.api_key}"
}