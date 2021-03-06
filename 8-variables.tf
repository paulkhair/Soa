################################ Resource group Section ################################################################

variable "rgp_nonprod" {
  description = "Provide main resource gorup name"
  type        = string
  default     = "AZRGPSOAN0002"
}
variable "rgp_soa" {
  description = "Provide main resource gorup name"
  type        = string
  default     = "AZRGPSOAN0003"
}

variable "rgp_fit" {
  description = "Provide FIT resource gorup name"
  type        = string
  default     = "AZRGPSOAN0004"
}
variable "rgp_trio" {
  description = "Provide TRIO resource gorup name"
  type        = string
  default     = "AZRGPSOAN0005"
}
variable "rgp_ptc" {
  description = "Provide PTC resource gorup name"
  type        = string
  default     = "AZRGPSOAN0007"
}

variable "rgp_db" {
  description = "Provide main resource gorup name"
  type        = string
  default     = "AZRGPSOAN0006"
}

variable "rgp_storage" {
  description = "Provide resource gorup name for Storage"
  type        = string
  default     = "AZRGPSOAN0008"
}
################################ ADIA Naming Standards ################################################################

variable "platform" {
  description = "Hosting Platfor Az -azure"
  type        = string
  default     = "az"

}
variable "eventgriddomain" {
  description = "Hosting Platfor Az -azure"
  type        = string
  default     = "azevdsoan0001"

}
variable "object" {
  description = "Object tier information"
  type        = map(string)
  default = {
    "azure_resource_group"        = "rgp"
    "azure_firewall"              = "afw"
    "azure_application_gateway"   = "agw"
    "azure_app_service"           = "app"
    "azure_api_Mgmt"              = "api"
    "app_service_plan"            = "asp"
    "disk"                        = "dbm"
    "virtual_network_gateway"     = "egw"
    "event_hub"                   = "evt"
    "azure_application_insights " = "ins"
    "linux_vm"                    = "lvm"
    "network_security_group"      = "nsg"
    "azure_sql_ml"                = "smi"
    "storage_account"             = "sta"
    "key_vault"                   = "klt"
    "virtual_network"             = "vnt"
    "windows_vm"                  = "wvm"

  }
}

variable "environment" {
  description = "Hosting Platfor Az -azure & VC vmware"
  type        = string
  default     = "n"
}

################################ Location ################################################################
variable "location" {
  description = "Azure environment location details"
  default     = "west europe"
  type        = string
}
################################ Application  ################################################################
variable "application" {
  description = "Application information"
  default     = ["SOA", "FIT", "TRIO", "PTC", "NonProd", "DB"]
  type        = list(string)
}

################################ Tags  ################################################################
variable "costcenter" {
  description = "Provide information of costcenter"
  default     = ""
  type        = string
}

variable "role" {
  default     = "APP"
  type        = string
  description = "Provide information of role of resource"
}

variable "env" {
  default     = ["dev", "sit", "ext"]
  #default = "Dev"
  type        = list(string)
  #type        = string
  description = "Provide information of environment of resource"
}

################################ VNET and SUBNETS ################################################################
variable "vnt_nonprod" {
  description = "Provide main VNET name"
  type        = string
  default     = "AZVNTSOAN0002"
}

variable "vnt_dns_servers" {
  description = "Provide DNS Ips VNET "
  type        = list(string)
  default     = ["172.19.1.4", "172.19.1.5"] # 172.19.1.4 and 172.19.1.5
}

variable "nonprod_virtual_network_address_space" {
  description = "Provide all address range of network"
  type        = list(string)
  default     = ["172.19.99.0/24", "172.19.100.0/24", "172.19.101.0/24", "172.19.102.0/24"]
}
variable "dev_db_subnet_name" {
  description = "Provide name for DB resources name in network"
  type        = string
  default     = "DEV_DB_SUBNET"
}
variable "dev_db_subnet_address_space" {
  description = "Provide subnet for DB resources IP range in network"
  type        = list(string)
  default     = ["172.19.99.0/25"]
}

variable "dev_vi_soa_dev_name" {
  description = "Provide subnet for web app services resources name in network"
  type        = string
  default     = "DEV_VI_SOA_DEV"
}
variable "dev_vi_soa_dev_address_space" {
  description = "Provide subnet for web app resources subnet IP range in network"
  type        = list(string)
  default     = ["172.19.99.128/28"]
}
variable "dev_vi_soa_sit_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VI_SOA_SIT"
}
variable "dev_vi_soa_sit_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.99.144/28"]
}

variable "dev_vi_fit_dev_name" {
  description = "Provide subnet for web app resources name in network"
  type        = string
  default     = "DEV_VI_FIT_DEV"
}
variable "dev_vi_fit_dev_address_space" {
  description = "Provide subnet for web app resources subet IP Range in network"
  type        = list(string)
  default     = ["172.19.99.160/28"]
}
variable "dev_vi_fit_sit_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VI_FIT_SIT"
}
variable "dev_vi_fit_sit_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.99.176/28"]
}
variable "dev_vi_ptc_dev_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VI_PTC_DEV"
}
variable "dev_vi_ptc_dev_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.99.192/28"]
}
variable "dev_vi_ptc_ext_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VI_PTC_EXT"
}
variable "dev_vi_ptc_ext_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.99.208/28"]
}
variable "dev_vi_ptc_sit_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VI_PTC_SIT"
}
variable "dev_vi_ptc_sit_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.99.224/28"]
}
variable "dev_vi_trio_dev_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VI_TRIO_DEV"
}
variable "dev_vi_trio_dev_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.99.240/28"]
}
variable "dev_vi_trio_sit_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VI_TRIO_SIT"
}
variable "dev_vi_trio_sit_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.100.0/28"]
}
#################################### Future use subnets #######################################

variable "dev_vi_xxx_0xx_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VI_XXX_0XX"
}
variable "dev_vi_xxx_0xx_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.100.16/28"]
}

variable "dev_vi_xxx_1xx_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VI_XXX_1XX"
}
variable "dev_vi_xxx_1xx_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.100.32/28"]
}
variable "dev_vi_xxx_2xx_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VI_XXX_2xx"
}
variable "dev_vi_xxx_2xx_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.100.48/28"]
}
variable "dev_vi_xxx_3xx_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VI_XXX_3XX"
}
variable "dev_vi_xxx_3xx_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.100.64/28"]
}
variable "dev_vi_xxx_4xx_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VI_XXX_4XX"
}
variable "dev_vi_xxx_4xx_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.100.80/28"]
}

variable "dev_vi_xxx_5xx_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VI_XXX_5XX"
}
variable "dev_vi_xxx_5xx_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.100.96/28"]
}
variable "dev_vi_xxx_6xx_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VI_XXX_6XX"
}
variable "dev_vi_xxx_6xx_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.100.112/28"]
}

variable "dev_pe_subnet_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_PE_SUBNET"
}
variable "dev_pe_subnet_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.100.128/25"]
}
variable "dev_vm_subnet_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_VM_SUBNET"
}
variable "dev_vm_subnet_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.101.0/26"]
}
variable "dev_gw_subnet_name" {
  description = "Provide subnet for webapps resources name in network"
  type        = string
  default     = "DEV_GW_SUBNET"
}
variable "dev_gw_subnet_address_space" {
  description = "Provide subnet for webapp resources subnet range in network"
  type        = list(string)
  default     = ["172.19.101.64/28"]
}
#################################### Peer Vnet  #######################################

variable "hub_virtual_network_id" {
  description = "Provide subnet for Gateway resources in network"
  type        = string
  default     = "/subscriptions/bc4aec72-c094-481d-ae83-5f7fe33e5db5/resourceGroups/AZRGPNETP0001_HUB/providers/Microsoft.Network/virtualNetworks/AZVNTHUBP0001"
}
#################################### SQL  #######################################
#
variable "sqlmi-dev-name" {
  description = "Provide name of the azure SQL-MI servername in dev enironment subcription"
  type        = string
  default     = "azsmisoan000"
}
variable "sqlmi-dev-admin-name" {
  description = "Provide name of the azure SQL-MI server administrator name in dev enironment subcription"
  type        = string
  default     = "mradministrator"
}
variable "sqlmi-dev-password" {
  description = "Provide name of the azure SQL-MI server administrator Password in dev enironment subcription"
  type        = string
  default     = "thisIsDog11"
}


variable "adf-dev-name" {
  description = "Provide name of he azure data factory in nonprod dev enironment subcription"
  type        = string
  default     = "AZADFSOAN0001"
}

#################################### Storage Account  #######################################
variable "nonprod_storage_account" {
  description = "Provide name for Storage Account"
  type        = string
  default     = "azstasoan0011"
}
variable "nonprod_cotainer_name" {
  description = "Provide name for Storage container"
  type        = string
  default     = "fs-test"
}
variable "nonprod_storage_pe_name" {
  description = "Provide name for Private endpoint for container"
  type        = string
  default     = "nonprod_storage_pe"
}


variable "nonprod_private_service_connection_name" {
  description = "Provide name for Private service connection name for provate endpoint"
  type        = string
  default     = "nonprod_private_service_connection"
}


variable "sta-dev-db" {
  description = "Provide name for Storage Account which used for Dev DB purpose"
  type        = string
  default     = "azstasoan0012"
}
variable "dev-cotainer-name" {
  description = "Provide name for Storage container"
  type        = string
  default     = "dev"
}
variable "sta-dev-pe" {
  description = "Provide name for Private endpoint for container used for dev DB activities"
  type        = string
  default     = "dev_db_pe"
}


variable "dev-db-private-service-connection-name" {
  description = "Provide name for Private service connection name for Dev DB activities"
  type        = string
  default     = "dev_db_private_service_connection"
}


#################################### NSG  #######################################
variable "nonprod_nsg_name" {
  description = "Provide name for Private service connection name for provate endpoint"
  type        = string
  default     = "nonprod_dev_db_nsg"
}

###############################################   WebApps Names  ##############################
variable "soa_dev_asp_name" {
  description = "Provide name for app service name for SOADEV MSPHost"
  type        = string
  default     = "soa-dev-asp"
}

variable "soa_dev_webapp_name" {
  description = "Provide name for web app  name for SOADEV MSPHosts"
  type        = set(string)
  #default     = ["soagateway", "mspdevshared"]
  default = ["soagateway", "mspdevshared", "mspdevaxon", "mspdev", "mspdevbbg", "mspdevedm", "mspdevff", "mspdevfit", "mspdevopd", "mspdevprecis", "mspdevshared", "mspdevtextanalyz", "mspdevtextextr", "mspdevtrio", "soadev"]
}
variable "nonprod_web_private_service_connection_name_soa_dev" {
  description = "Provide name for webapp Private service connection name for private endpoint"
  type        = string
  default     = "nonprod_web_private_service_connection"
}

variable "soa_sit_asp_name" {
  description = "Provide name for app service name for SOA-SIT MSPHost"
  type        = string
  default     = "soa-sit-asp"
}

variable "soa_sit_webapp_name" {
  description = "Provide name for web app  name for SOA-SIT MSPHosts"
  type        = set(string)
  default     = ["mspsitaxon"]
  #default     = ["mspsitaxon", "mspsit", "mspsitedm", "mspsitemail", "mspsitff", "mspsitfit", "mspsitopd", "mspsitprecis", "mspsitptc", "mspsitshared", "mspsittextanalyz", "mspsittextextr", "mspsittrio", "soasit", "sitsoaexplorer]
}
variable "nonprod_web_private_service_connection_name_soa-sit" {
  description = "Provide name for webapp Private service connection name for private endpoint"
  type        = string
  default     = "nonprod_web_private_service_connection_soa_sit"
}

variable "fit_dev_asp_name" {
  description = "Provide name for app service name for fit_dev MSPHost"
  type        = string
  default     = "fit_dev-asp"

}

variable "fit_dev_webapp_name" {
  description = "Provide name for web app ??name for fit_dev MSPHosts"
  type        = set(string)
  default     = ["fitmspdev"] #, "fitmspdevshared", "fitmspdevfit", "fitsoadev"]
}


variable "nonprod_web_private_service_connection_name_fit_dev" {
  description = "Provide name for webapp Private service connection name for private endpoint"
  type        = string
  default     = "nonprod_web_private_service_connection_fit_dev"
}

variable "fit_sit_asp_name" {
  description = "Provide name for app service name for fit_sit MSPHost"
  type        = string
  default     = "fit_sit-asp"

}

variable "fit_sit_webapp_name" {
  description = "Provide name for web app ??name for fit_sit MSPHosts"
  type        = set(string)
  default     = ["fitmspsitfit"] #, "fitmspsitpatch", "fitmspsit", "fitmspsitshared", "fitsoasit"]
}


variable "nonprod_web_private_service_connection_name_fit_sit" {
  description = "Provide name for webapp Private service connection name for private endpoint"
  type        = string
  default     = "nonprod_web_private_service_connection_fit_"
}

variable "trio_dev_asp_name" {
  description = "Provide name for app service name for trio_dev MSPHost"
  type        = string
  default     = "trio_dev-asp"

}

variable "trio_dev_webapp_name" {
  description = "Provide name for web app ??name for trio_dev MSPHosts"
  type        = set(string)
  default     = ["triosoadev", "triomspdev", "triomspdevfit", "triomspdevshared", "triomspdevtrio"]
}


variable "nonprod_web_private_service_connection_name_trio_dev" {
  description = "Provide name for webapp Private service connection name for private endpoint"
  type        = string
  default     = "nonprod_web_private_service_connection_trio_dev"
}

variable "trio_sit_asp_name" {
  description = "Provide name for app service name for trio_sit MSPHost"
  type        = string
  default     = "trio_sit-asp"

}

variable "trio_sit_webapp_name" {
  description = "Provide name for web app ??name for trio_sit MSPHosts"
  type        = set(string)
  default     = ["triosoasit", "triomspsit", "triomspsitfit", "triomspsitshared", "triomspsittrio", "triositpositions"]
}


variable "nonprod_web_private_service_connection_name_trio_sit" {
  description = "Provide name for webapp Private service connection name for private endpoint"
  type        = string
  default     = "nonprod_web_private_service_connection_trio_sit"
}

variable "ptc_ext_asp_name" {
  description = "Provide name for app service name for ptc_ext MSPHost"
  type        = string
  default     = "ptc_ext-asp"

}

variable "ptc_ext_webapp_name" {
  description = "Provide name for web app ??name for ptc_ext MSPHosts"
  type        = set(string)
  default     = ["ptcmspext", "ptcmspextptc", "ptcmspextshared", "ptcsoaext"]
}


variable "nonprod_web_private_service_connection_name_ptc_ext" {
  description = "Provide name for webapp Private service connection name for private endpoint"
  type        = string
  default     = "nonprod_web_private_service_connection_ptc_ext"
}

variable "ptc_dev_asp_name" {
  description = "Provide name for app service name for ptc_dev MSPHost"
  type        = string
  default     = "ptc_dev-asp"

}

variable "ptc_dev_webapp_name" {
  description = "Provide name for web app ??name for ptc_dev MSPHosts"
  type        = set(string)
  default     = ["ptcmspdev", "ptcmspdevptc", "ptcmspdevshared", "ptcsoadev"]
}


variable "nonprod_web_private_service_connection_name_ptc_dev" {
  description = "Provide name for webapp Private service connection name for private endpoint"
  type        = string
  default     = "nonprod_web_private_service_connection_ptc_dev"
}
variable "ptc_sit_asp_name" {
  description = "Provide name for app service name for ptc_sit MSPHost"
  type        = string
  default     = "ptc_sit-asp"

}

variable "ptc_sit_webapp_name" {
  description = "Provide name for web app ??name for ptc_sit MSPHosts"
  type        = set(string)
  default     = ["ptcmspsit", "ptcmspsitptc", "ptcmspsitshared", "ptcsoasit"]
}


variable "nonprod_web_private_service_connection_name_ptc_sit" {
  description = "Provide name for webapp Private service connection name for private endpoint"
  type        = string
  default     = "nonprod_web_private_service_connection_ptc_sit"
}


################################## Mongo DB ##############################
variable "lvm-dev-mongo-name" {
  description = "Provide name for linux VM which is provisining for Mongo DB"
  type        = string
  default     = "AZLVMNVMN0001"
}
variable "lvm-dev-mongo-name-2" {
  description = "Provide name for linux VM which is provisining for Mongo DB"
  type        = string
  default     = "AZLVMNVMN0002"
}
variable "lvm-dev-mongo-size" {
  description = "Provide name for linux VM size which is provisining for Mongo DB"
  type        = string
  #default     = "Standard_E8-2s_v5"
  default = "Standard_L8s_v2"
}
variable "lvm-dev-mongo-size-2" {
  description = "Provide name for linux VM size which is provisining for Mongo DB"
  type        = string
  default     = "Standard_B4ms"
  #default     = "Standard_L8s_v2"
}
variable "lvm-admin-username" {
  description = "Provide name for name of admin user which is provisining for Mongo DB"
  type        = string
  default     = "atosadmin"
  sensitive   = true
}
variable "lvm-admin-password" {
  description = "Provide name for name of password user which is provisining for Mongo DB"
  type        = string
  default     = "Atosadmin@123"
  sensitive   = true
}


################################## Managment ##############################

variable "wvm-dev-mgmt-name" {
  description = "Provide name for Windows VM which is provisining for Management VM"
  type        = string
  default     = "AZWVMNVMN0001"
}
variable "wvm-dev-mgmt-size" {
  description = "Provide name for linux VM size which is provisining for Management VM"
  type        = string
  default     = "Standard_B2ms"
}
variable "wvm-admin-username" {
  description = "Provide name for name of admin user which is provisining for Management VM"
  type        = string
  default     = "atosadmin"
  sensitive   = true
}
variable "wvm-admin-password" {
  description = "Provide password for windows admin user which is provisining for Management VM"
  type        = string
  default     = "Atosadmin@123"
  sensitive   = true
}


/*


o	AFW - Azure Firewall
o	AGW - Azure Application Gateway
o	APP - Azure App Service
o	API - API Management
o	ASG - Application Security Group
o	ASP - App Service Plan
o	AST - Availability Set (for virtual machines)
o	AVM - Appliance Virtual Machine
o	BOT - Web App Bot
o	CDP - CDN profile
o	CGN - Cognitive Services
o	DBM - Disk
o	EGW - Virtual Network Gateway
o	EXR - Express Route
o	EVT - Event Hub
o	INS - Azure Application Insights 
o	LVM - Linux (Red Hat) virtual machine
o	NSG - Network Security Group
o	PVA - Purview Account
o	RED - Azure Cache for Redis
o	SBN - Service Bus Namespace
o	SCH - Search Service
o	SQP - Synapse SQL Pool
o	SQS - Azure SQL Database
o	SWS - Synapse Workspace
o	EDB - Azure Elastic Pool SQL Server
o	SMI - Azure SQL Managed Instance
o	CDB - Azure Cosmos Database 
o	STA - Storage Account
o	UDR - Route Table
o	VGW - Virtual Gateway
o	VLT - Key vault
o	VNT - Virtual Network
o	WKS - Log Analytics workspace
o	WVM - Windows virtual machine
o	OVM- Oracle Database virtual Machine 
o	SVM- MSSQL Server database virtual Machine 
o	JVM- Oracle Weblogic Virtual Machine
o	MVM- Mysql Server database virtual Machine 
o	NVM- MongoDB database virtual Machine
o	IVM- Influx DB database virtual Machine
*/