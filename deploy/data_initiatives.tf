## General location and resource types
data "azurerm_policy_definition" "allowed_locations" {
  display_name = "Allowed locations"
  # west europe, us east, asia east
}

data "azurerm_policy_definition" "not_allowed_resource_types" {
  display_name = "Not allowed resource types"
}

## CIS Framework & Microsoft Cloud Security Benchmark 

data "azurerm_policy_definition" "owner_mfa_enabled" {
  display_name = "Accounts with owner permissions on Azure resources should be MFA enabled"
}

data "azurerm_policy_set_definition" "az_security_benchmark" {
  display_name = "Microsoft cloud security benchmark"
}

data "azurerm_policy_definition" "nsg_ports_secured" {
  display_name = "All network ports should be restricted on network security groups associated to your virtual machine"
}

data "azurerm_policy_definition" "vm_protected_nsg" {
  display_name = "Internet-facing virtual machines should be protected with network security groups"
}

data "azurerm_policy_definition" "subnets_nsg" {
  display_name = "Subnets should be associated with a Network Security Group"
}

# Secure cloud services with network controls
data "azurerm_policy_definition" "api_services_vnet" {
  display_name = "API Management services should use a virtual network"
}

data "azurerm_policy_definition" "app_private_link" {
  display_name = "App Configuration should use private link"
}

data "azurerm_policy_definition" "k8s_ip_authorized" {
  display_name = "Authorized IP ranges should be defined on Kubernetes Services"
}

data "azurerm_policy_definition" "cosmosdb_firewall_accounts" {
  display_name = "Azure Cosmos DB accounts should have firewall rules"
}

data "azurerm_policy_definition" "databricks_nopip" {
  display_name = "Azure Databricks Clusters should disable public IP"
}

data "azurerm_policy_definition" "databricks_vnet" {
  display_name = "Azure Databricks Workspaces should be in a virtual network"
}

data "azurerm_policy_definition" "databricks_no_public_network" {
  display_name = "Azure Databricks Workspaces should disable public network access"
}

data "azurerm_policy_definition" "databricks_private_link" {
  display_name = "Azure Databricks Workspaces should use private link"
}

data "azurerm_policy_definition" "eventgrid_private_link" {
  display_name = "Azure Event Grid domains should use private link"
}

data "azurerm_policy_definition" "eventgrid_topics_private_link" {
  display_name = "Azure Event Grid topics should use private link"
}

data "azurerm_policy_definition" "ml_vnet" {
  display_name = "Azure Machine Learning Computes should be in a virtual network"
}

data "azurerm_policy_definition" "ml_no_public_network" {
  display_name = "Azure Machine Learning Workspaces should disable public network access"
}

data "azurerm_policy_definition" "ml_private_link" {
  display_name = "Azure Machine Learning workspaces should use private link"
}

data "azurerm_policy_definition" "cognitive_services_no_public_network" {
  display_name = "Cognitive Services accounts should disable public network access"
}

data "azurerm_policy_definition" "cognitive_services_restrict_network" {
  display_name = "Cognitive Services accounts should restrict network access"
}

data "azurerm_policy_definition" "acr_no_unresticted_network" {
  display_name = "Container registries should not allow unrestricted network access"
}

data "azurerm_policy_definition" "acr_private_link" {
  display_name = "Container registries should use private link"
}

data "azurerm_policy_definition" "sql_private_endpoint" {
  display_name = "Private endpoint connections on Azure SQL Database should be enabled"
}

data "azurerm_policy_definition" "sql_no_public_network" {
  display_name = "Public network access on Azure SQL Database should be disabled"
}

data "azurerm_policy_definition" "sa_no_unrestricted_network" {
  display_name = "Storage accounts should restrict network access"
}

data "azurerm_policy_definition" "sa_network_rules" {
  display_name = "Storage accounts should restrict network access using virtual network rules"
}

data "azurerm_policy_definition" "sa_private_link" {
  display_name = "Storage accounts should use private link"
}

data "azurerm_policy_definition" "ml_no_local_auth" {
  display_name = "Azure Machine Learning Computes should have local authentication methods disabled"
}

data "azurerm_policy_definition" "fabric_aad_client_auth" {
  display_name = "Service Fabric clusters should only use Azure Active Directory for client authentication"
}

data "azurerm_policy_definition" "audit_custom_rbac_roles" {
  display_name = "Audit usage of custom RBAC roles"
}

data "azurerm_policy_definition" "log_analytics_subscription" {
  display_name = "Auto provisioning of the Log Analytics agent should be enabled on your subscription"
}

data "azurerm_policy_definition" "additional_email_subscription" {
  display_name = "Subscriptions should have a contact email address for security issues"
}

data "azurerm_policy_definition" "email_high_severity_alerts" {
  display_name = "Email notification for high severity alerts should be enabled"
}

data "azurerm_policy_definition" "no_forwarding_ip_vm" {
  display_name = "IP Forwarding on your virtual machine should be disabled"
}

data "azurerm_policy_definition" "vm_jit_management_ports" {
  display_name = "Management ports of virtual machines should be protected with just-in-time network access control"
}
# OR
data "azurerm_policy_definition" "vm_management_ports_disabled" {
  display_name = "Management ports should be closed on your virtual machines"
}

data "azurerm_policy_definition" "ddos_standard" {
  display_name = "Azure DDoS Protection should be enabled"
}

data "azurerm_policy_definition" "waf_frontdoor" {
  display_name = "Azure Web Application Firewall should be enabled for Azure Front Door entry-points"
}

data "azurerm_policy_definition" "waf_applications_gateway" {
  display_name = "Web Application Firewall (WAF) should be enabled for Application Gateway"
}

data "azurerm_policy_definition" "app_service_tls" {
  display_name = "App Service apps should use the latest TLS version"
}

data "azurerm_policy_definition" "function_app_tls" {
  display_name = "Function apps should use the latest TLS version"
}

data "azurerm_policy_definition" "sa_secure_transfer" {
  display_name = "Secure transfer to storage accounts should be enabled"
}

data "azurerm_policy_definition" "nic_no_public_ip" {
  display_name = "Network interfaces should not have public IPs"
}

data "azurerm_policy_definition" "kv_firewall_enabled" {
  display_name = "Azure Key Vault should have firewall enabled"
}

data "azurerm_policy_definition" "location_match" {
  display_name = "Audit resource location matches resource group location"
}

data "azurerm_policy_definition" "vpn_no_basic_sku" {
  display_name = "Azure VPN gateways should not use 'basic' SKU"
}

data "azurerm_policy_definition" "nsg_flow_logs" {
  display_name = "Flow logs should be configured for every network security group"
}

data "azurerm_policy_definition" "sql_transparent_data_encryption" {
  display_name = "Transparent Data Encryption on SQL databases should be enabled"
}

data "azurerm_policy_definition" "ssl_postgres" {
  display_name = "Enforce SSL connection should be enabled for PostgreSQL database servers"
}

data "azurerm_policy_definition" "vm_approved_extensions" {
  display_name = "Only approved VM extensions should be installed"
}

data "azurerm_policy_definition" "vm_updates" {
  display_name = "System updates should be installed on your machines"
}

data "azurerm_policy_definition" "monitor_endpoint_protection" {
  display_name = "Monitor missing Endpoint Protection in Azure Security Center"
}

data "azurerm_policy_definition" "kv_deletion_protection" {
  display_name = "Key vaults should have deletion protection enabled"
}

data "azurerm_policy_definition" "https_app_service" {
  display_name = "App Service apps should only be accessible over HTTPS"
}

data "azurerm_policy_definition" "https_function_app" {
  display_name = "Function apps should only be accessible over HTTPS"
}

data "azurerm_policy_definition" "k8s_https" {
  display_name = "Kubernetes clusters should be accessible only over HTTPS"
}

data "azurerm_policy_definition" "logs_app_service" {
  display_name = "App Service apps should have resource logs enabled"
}

data "azurerm_policy_definition" "ads_logs" {
  display_name = "Resource logs in Azure Data Lake Store should be enabled"
}

data "azurerm_policy_definition" "databricks_logs" {
  display_name = "Resource logs in Azure Databricks Workspaces should be enabled"
}

data "azurerm_policy_definition" "k8s_logs" {
  display_name = "Resource logs in Azure Kubernetes Service should be enabled"
}

data "azurerm_policy_definition" "aml_logs" {
  display_name = "Resource logs in Azure Machine Learning Workspaces should be enabled"
}

data "azurerm_policy_definition" "stream_analytics_logs" {
  display_name = "Resource logs in Azure Stream Analytics should be enabled"
}

data "azurerm_policy_definition" "batch_accounts_logs" {
  display_name = "Resource logs in Batch accounts should be enabled"
}

data "azurerm_policy_definition" "datalake_logs" {
  display_name = "Resource logs in Data Lake Analytics should be enabled"
}

data "azurerm_policy_definition" "event_hub_logs" {
  display_name = "Resource logs in Event Hub should be enabled"
}

data "azurerm_policy_definition" "kv_logs" {
  display_name = "Resource logs in Key Vault should be enabled"
}

data "azurerm_policy_definition" "logic_apps_logs" {
  display_name = "Resource logs in Logic Apps should be enabled"
}

data "azurerm_policy_definition" "search_services_logs" {
  display_name = "Resource logs in Search services should be enabled"
}

data "azurerm_policy_definition" "service_bus_logs" {
  display_name = "Resource logs in Service Bus should be enabled"
}

data "azurerm_policy_definition" "alert_policy_operation" {
  display_name = "An activity log alert should exist for specific Policy operations"
}

data "azurerm_policy_definition" "alert_administrative_operation" {
  display_name = "An activity log alert should exist for specific Administrative operations"
}

data "azurerm_policy_definition" "k8s_policy_addon" {
  display_name = "Azure Policy Add-on for Kubernetes service (AKS) should be installed and enabled on your clusters"
}

data "azurerm_policy_definition" "k8s_allowed_images" {
  display_name = "Kubernetes cluster containers should only use allowed images"
} # done in asc_default

data "azurerm_policy_definition" "k8s_hostpath" {
  display_name = "Kubernetes cluster pod hostPath volumes should only use allowed host paths"
}

data "azurerm_policy_definition" "k8s_port_range" {
  display_name = "Kubernetes cluster pods should only use approved host network and port range"
}

data "azurerm_policy_definition" "k8s_no_default_ns" {
  display_name = "Kubernetes clusters should not use the default namespace"
}

data "azurerm_policy_definition" "acr_resolved" {
  display_name = "Azure registry container images should have vulnerabilities resolved (powered by Qualys)"
}

data "azurerm_policy_definition" "vmss_security_updates" {
  display_name = "System updates on virtual machine scale sets should be installed"
}

data "azurerm_policy_definition" "mariadb_no_access" {
  display_name = "Public network access should be disabled for MariaDB servers"
}

data "azurerm_policy_definition" "mariadb_private_end" {
  display_name = "Private endpoint should be enabled for MariaDB servers"
}
