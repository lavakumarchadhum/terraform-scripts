provider "azurerm" {
  client_id = ""
  client_secret = ""
  subscription_id = ""
  tenant_id = ""
}
#deploying LogicApp 

resource "azurerm_logic_app_workflow" "main" {
  name                = "${var.prefixlp}-${var.app}-${var.suffixlp}"
  location            = "${var.azurerm_resource_group_location}"
  resource_group_name = "${var.app}-${var.envr}-${var.rgn}-${var.suffix}"
  count =  "${var.PROVISION_LOGIC_APP_WORKFLOW? 1:0}"
  tags {

  }
}

