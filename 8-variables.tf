variable "rgp_nonprod" {
  description = "Provide main resource gorup name"
  type        = string
  default     = "azrgpsoan0001"
}
variable "rgp_soa" {
  description = "Provide main resource gorup name"
  type        = string
  default     = "azrgpsoan0002"
}

variable "rgp_fit" {
  description = "Provide FIT resource gorup name"
  type        = string
  default     = "azrgpsoan0003"
}
variable "rgp_trio" {
  description = "Provide TRIO resource gorup name"
  type        = string
  default     = "azrgpsoan0004"
}
variable "rgp_ptc" {
  description = "Provide PTC resource gorup name"
  type        = string
  default     = "azrgpsoan0005"
}

variable "rgp_db" {
  description = "Provide main resource gorup name"
  type        = string
  default     = "azrgpsoan0006"
}

variable "rgp_storage" {
  description = "Provide resource gorup name for Storage"
  type        = string
  default     = "azrgpsoan0007"
}

variable "platform" {
  description = "Hosting Platfor Az -azure"
  type        = string
  default     = "az"

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

variable "location" {
  description = "Azure environment location details"
  default     = "west europe"
  type        = string
}

variable "application" {
  description = "Application information"
  default     = ["SOA", "FIT", "TRIO", "PTC", "NonProd", "DB"]
  type        = list(string)
}

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
  default     = "Dev"
  type        = string
  description = "Provide information of environment of resource"
}

variable "vnt_nonprod" {
  description = "Provide main VNET name"
  type        = string
  default     = "azvntsoan0001"
}

variable "nonprod_virtual_network_address_space" {
  description = "Provide all address range of network"
  type        = list(string)
  default     = ["172.19.99.0/24", "172.19.100.0/24", "172.19.101.0/24", "172.19.102.0/24"]
}

variable "dev_db_subnet_address_space" {
  description = "Provide subnet for DB resources in network"
  type        = list(string)
  default     = ["172.19.99.0/25"]
}
variable "dev_db_subnet_name" {
  description = "Provide name for DB resources in network"
  type        = string
  default     = "dev_db_subnet"
}
variable "dev_web_subnet_address_space" {
  description = "Provide subnet for web resources in network"
  type        = list(string)
  default     = ["172.19.99.128/25"]
}
variable "dev_web_subnet_name" {
  description = "Provide subnet for web resources in network"
  type        = string
  default     = "dev_web_subnet"
}

variable "dev_pe_subnet_address_space" {
  description = "Provide subnet for Private endpoints resources in network"
  type        = list(string)
  default     = ["172.19.100.0/25"]
}
variable "dev_pe_subnet_name" {
  description = "Provide name for dev pe resources in network"
  type        = string
  default     = "dev_pe_subnet"
}

variable "dev_gw_subnet_address_space" {
  description = "Provide subnet for Gateway resources in network"
  type        = list(string)
  default     = ["172.19.100.128/26"]
}
variable "dev_gw_subnet_name" {
  description = "Provide name for Gateway resources in network"
  type        = string
  default     = "dev_gw_subnet"
}

variable "uat_db_subnet_address_space" {
  description = "Provide subnet for DB resources in network"
  type        = list(string)
  default     = ["172.19.101.0/24"]
}
variable "uat_db_subnet_name" {
  description = "Provide name for DB resources in network"
  type        = string
  default     = "uat_db_subnet"
}

variable "uat_web_subnet_address_space" {
  description = "Provide subnet for web resources in network"
  type        = list(string)
  default     = ["172.19.102.0/25"]
}
variable "uat_web_subnet_name" {
  description = "Provide name for Web resources in network"
  type        = string
  default     = "uat_web_subnet"
}

variable "uat_pe_subnet_address_space" {
  description = "Provide subnet for Private endpoint resources in network"
  type        = list(string)
  default     = ["172.19.102.128/25"]
}
variable "uat_pe_subnet_name" {
  description = "Provide name for PE resources in network"
  type        = string
  default     = "uat_pe_subnet"
}

variable "uat_gw_subnet_address_space" {
  description = "Provide subnet for Gateway resources in network"
  type        = list(string)
  default     = ["172.19.100.192/26"]
}
variable "uat_gw_subnet_name" {
  description = "Provide name for Gateway resources in network"
  type        = string
  default     = "uat_gw_subnet"
}

variable "hub_virtual_network_id" {
  description = "Provide subnet for Gateway resources in network"
  type        = string
  default     = "/subscriptions/bc4aec72-c094-481d-ae83-5f7fe33e5db5/resourceGroups/AZRGPNETP0001_HUB/providers/Microsoft.Network/virtualNetworks/AZVNTHUBP0001"
}

variable "nonprod_storage_account" {
  description = "Provide name for Storage Account"
  type        = string
  default     = "azstasoan0010"
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

variable "nonprod_nsg_name" {
  description = "Provide name for Private service connection name for provate endpoint"
  type        = string
  default     = "nonprod_dev_db_nsg"
}

variable "soa_dev_asp_name" {
  description = "Provide name for app service name for SOADEV MSPHost"
  type        = string
  default     = "soa-dev-asp"
}

variable "soa_dev_webapp_name" {
  description = "Provide name for web app  name for SOADEV MSPHosts"
  type        = set(string)
  default     = ["mspdevaxon", "123"]
  #default     = ["mspdevaxon", "mspdev", "mspdevbbg", "mspdevedm", "mspdevff", "mspdevfit", "mspdevopd", "mspdevprecis", "mspdevshared", "mspdevtextanalyz", "mspdevtextextr", "mspdevtrio", "soadev", "fitsoadev"]
}
variable "nonprod_web_private_service_connection_name" {
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
  default     = ["mspsitaxon", "mspsit"]
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
  description = "Provide name for web app  name for fit_dev MSPHosts"
  type        = set(string)
  default     = ["fitmspdev", "fitmspdevshared", "fitmspdevfit"]
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
  description = "Provide name for web app  name for fit_sit MSPHosts"
  type        = set(string)
  default     = ["fitmspsitfit", "fitmspsitpatch", "fitmspsit", "fitmspsitshared", "fitsoasit"]
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
  description = "Provide name for web app  name for trio_dev MSPHosts"
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
  description = "Provide name for web app  name for trio_sit MSPHosts"
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
  description = "Provide name for web app  name for ptc_ext MSPHosts"
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
  description = "Provide name for web app  name for ptc_dev MSPHosts"
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
  description = "Provide name for web app  name for ptc_sit MSPHosts"
  type        = set(string)
  default     = ["ptcmspsit", "ptcmspsitptc", "ptcmspsitshared", "ptcsoasit"]
}


variable "nonprod_web_private_service_connection_name_ptc_sit" {
  description = "Provide name for webapp Private service connection name for private endpoint"
  type        = string
  default     = "nonprod_web_private_service_connection_ptc_sit"
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