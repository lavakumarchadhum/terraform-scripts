provider "azurerm" {
  client_id = ""
  client_secret = ""
  subscription_id = ""
  tenant_id = ""
}

#Deploying Cosmos
#CREATING AZURE COSMOSDB done 
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}
resource "azurerm_cosmosdb_account" "datacosmos" {
  name                = "${var.app}-${var.envr}-${var.rgn}-${var.suffixdb}"
  location            = "${var.azurerm_resource_group_location}"
  resource_group_name = "${var.app}-${var.envr}-${var.rgn}-${var.suffix}"
  offer_type          = "${var.azurerm_cosmos_offer_type}"
  kind                = "${var.azurerm_cosmos_kind}"
  enable_multiple_write_locations = "${var.azurerm_enable_multiple_write_locations}" 
  enable_automatic_failover = "${var.azurerm_cosmos_enable_automatic_failover}"
  count =  "${var.PROVISION_COSMOSDB_ACCOUNT? 1:0}"
  consistency_policy {
    consistency_level       = "${var.azurerm_cosmos_consistency_level}"
    max_interval_in_seconds = "${var.azurerm_cosmos_max_interval_in_seconds}"
    max_staleness_prefix    = "${var.azurerm_cosmos_max_staleness_prefix}"
  }
  geo_location {
    location          = "${var.db_location}"
    failover_priority = "${var.db_location_failover_priority}"
  }

  
     tags {
   
  }
}
