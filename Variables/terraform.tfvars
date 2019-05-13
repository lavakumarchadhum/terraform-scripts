app= "3mtest" 

# ENVIRONMENT NAME 
# envr = Perf, Prod, Non-prod, UAT, QA     
envr="dev"

# REGION
#Rgn = Us east, Us west, Us Central, Us north, Us south.
rgn="west us"

#SUFFIX OF RESOURCE GROUP NAME
suffix = "rgptn"

#SUFFIX OF STORAGE ACCOUNT NAME
suffixsto = "usept"



#LOCATION OF ALL THE RESOURCES THAT ARE PROVISIONED
azurerm_resource_group_location="eastus"


    #STORAGEACCOUNT

#DEFAULT VALUE FOR ACCOUNT TIER ARE STANDARD AND PREMIUM
#DEFAULT VALUE FOR ACCESS TIER ARE HOT AND COOL
#DEFAULT VALUE FOR REPLICATION TYPE ARE LRS, GRS,RAGRS and ZRS
azurerm_storage_account_kind="StorageV2"
azurerm_storage_account_actier="Standard"
azurerm_storage_account_replication_type="RAGRS"
azurerm_storage_account_access_tier="Hot"
azurerm_storage_account_https_traffic=true
azurerm_storage_account_enable_file_encryption=true
containers =6
azurerm_storage_container_name=["3m-static"]
azurerm_storage_container_container_access_type=["blob"]


    #Pipeline Specific

PROVISION_STORAGE_ACCOUNT = true