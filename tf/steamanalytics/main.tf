provider "azurerm" {
  client_id = ""
  client_secret = ""
  subscription_id = ""
  tenant_id = ""
}
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
 location = "West US"
}

resource "azurerm_stream_analytics_job" "example" {
  name                                     = "example-job"
  resource_group_name                      = "${azurerm_resource_group.example.name}"
  location                                 = "${azurerm_resource_group.example.location}"
  compatibility_level                      = "1.1"
  data_locale                              = "en-GB"
  events_late_arrival_max_delay_in_seconds = 60
  events_out_of_order_max_delay_in_seconds = 50
  events_out_of_order_policy               = "Adjust"
  output_error_policy                      = "Drop"
  streaming_units                          = 3

  transformation_query = <<QUERY
    SELECT *
    INTO [YourOutputAlias]
    FROM [YourInputAlias]
QUERY
}