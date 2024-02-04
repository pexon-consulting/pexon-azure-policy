resource "azurerm_management_group_policy_assignment" "tnt_asc_default" {
  name = "tnt_asc_default"
  display_name = format("%s %s",data.azurerm_policy_set_definition.az_security_benchmark.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_set_definition.az_security_benchmark.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_set_definition.az_security_benchmark.description
  parameters = <<PARAMETERS
{
  "allowedContainerImagesInKubernetesClusterEffect": {
    "value": "${local.auditeffect}" 
  },
  "allowedContainerImagesInKubernetesClusterRegex": {
    "value": "${local.allowed_docker_images_regex_kubernetes}"
  },
  "allowedContainerPortsInKubernetesClusterPorts": {
    "value": ["80", "22", "443", "1883", "4180", "4369", "5000", "5005", "8080", "8125", "8126", "8443", "8883", "8888", "9100", "9101", "9102", "9103", "9104", "9105", "9106", "9107", "9108", "9109", "9402", "9987", "9990", "10250", "44053", "44180"]
  },
  "allowedservicePortsInKubernetesClusterPorts": {
    "value": ["80", "22", "443", "1883", "4369", "5005", "8080", "8443", "8883", "8888", "9402", "9987", "9990", "44180"]
  },
  "allowedHostNetworkingAndPortsInKubernetesClusterNamespaceExclusion": {
    "value": ["kube-system","gatekeeper-system","azure-arc","datadog","aad-identity"]
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_owner_mfa" {
  name = "tnt_owner_mfa"
  display_name = format("%s %s",data.azurerm_policy_definition.owner_mfa_enabled.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.owner_mfa_enabled.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.owner_mfa_enabled.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_nsg_ports_secured" {
  name = "tnt_nsg_ports"
  display_name = format("%s %s",data.azurerm_policy_definition.nsg_ports_secured.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.nsg_ports_secured.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.nsg_ports_secured.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_vm_protected_nsg" {
  name = "tnt_protected"
  display_name = format("%s %s",data.azurerm_policy_definition.vm_protected_nsg.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.vm_protected_nsg.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.vm_protected_nsg.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_subnets_nsg" {
  name = "tnt_subnets_nsg"
  display_name = format("%s %s",data.azurerm_policy_definition.subnets_nsg.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.subnets_nsg.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.subnets_nsg.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_api_vnet" {
  name = "tnt_api__vnet"
  display_name = format("%s %s",data.azurerm_policy_definition.api_services_vnet.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.api_services_vnet.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.api_services_vnet.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_link" {
  name = "tnt_app_link"
  display_name = format("%s %s",data.azurerm_policy_definition.app_private_link.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.app_private_link.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.app_private_link.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_k8s_ip_authorized" {
  name = "tnt_k8s_ip"
  display_name = format("%s %s",data.azurerm_policy_definition.k8s_ip_authorized.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.k8s_ip_authorized.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.k8s_ip_authorized.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_cosmosdb_firewall_accounts" {
  name = "tnt_cosmosdb_fire"
  display_name = format("%s %s",data.azurerm_policy_definition.cosmosdb_firewall_accounts.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.cosmosdb_firewall_accounts.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.cosmosdb_firewall_accounts.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_databricks_nopip" {
  name = "tnt_db_nopip"
  display_name = format("%s %s",data.azurerm_policy_definition.databricks_nopip.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.databricks_nopip.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.databricks_nopip.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_databricks_vnet" {
  name = "tnt_dbs_vnet"
  display_name = format("%s %s",data.azurerm_policy_definition.databricks_vnet.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.databricks_vnet.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.databricks_vnet.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_databricks_no_public_network" {
  name = "tnt_db_no_public_network"
  display_name = format("%s %s",data.azurerm_policy_definition.databricks_no_public_network.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.databricks_no_public_network.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.databricks_no_public_network.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_databricks_private_link" {
  name = "tnt_db_private"
  display_name = format("%s %s",data.azurerm_policy_definition.databricks_private_link.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.databricks_private_link.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.databricks_private_link.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_eventgrid_private_link" {
  name = "tnt_eventgrid_priv"
  display_name = format("%s %s",data.azurerm_policy_definition.eventgrid_private_link.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.eventgrid_private_link.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.eventgrid_private_link.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_ml_vnet" {
  name = "tnt_ml_vnet"
  display_name = format("%s %s",data.azurerm_policy_definition.ml_vnet.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.ml_vnet.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.ml_vnet.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_ml_no_public_network" {
  name = "tnt_ml_no"
  display_name = format("%s %s",data.azurerm_policy_definition.ml_no_public_network.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.ml_no_public_network.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.ml_no_public_network.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_ml_private_link" {
  name = "tnt_ml_private_link"
  display_name = format("%s %s",data.azurerm_policy_definition.ml_private_link.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.ml_private_link.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.ml_private_link.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_cognitive_services_no_public_network" {
  name = "tnt_cog_no"
  display_name = format("%s %s",data.azurerm_policy_definition.cognitive_services_no_public_network.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.cognitive_services_no_public_network.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.cognitive_services_no_public_network.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_cognitive_services_restrict_network" {
  name = "tnt_cogs_rest"
  display_name = format("%s %s",data.azurerm_policy_definition.cognitive_services_restrict_network.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.cognitive_services_restrict_network.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.cognitive_services_restrict_network.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_acr_no_unresticted_network" {
  name = "tnt_acr_no_network"
  display_name = format("%s %s",data.azurerm_policy_definition.acr_no_unresticted_network.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.acr_no_unresticted_network.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.acr_no_unresticted_network.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_acr_private_link" {
  name = "tnt_acr_link"
  display_name = format("%s %s",data.azurerm_policy_definition.acr_private_link.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.acr_private_link.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.acr_private_link.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_sql_private" {
  name = "tnt_sql_private"
  display_name = format("%s %s",data.azurerm_policy_definition.sql_private_endpoint.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.sql_private_endpoint.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.sql_private_endpoint.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_sql_no_public_network" {
  name = "tnt_sql_no_network"
  display_name = format("%s %s",data.azurerm_policy_definition.sql_no_public_network.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.sql_no_public_network.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.sql_no_public_network.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_sa_no_unrestricted_network" {
  name = "tnt_sa_no_un_network"
  display_name = format("%s %s",data.azurerm_policy_definition.sa_no_unrestricted_network.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.sa_no_unrestricted_network.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.sa_no_unrestricted_network.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "Disabled"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_sa_network_rules" {
  name = "tnt_sa_network_rules"
  display_name = format("%s %s",data.azurerm_policy_definition.sa_network_rules.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.sa_network_rules.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.sa_network_rules.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_sa_private_link" {
  name = "tnt_sa_private_link"
  display_name = format("%s %s",data.azurerm_policy_definition.sa_private_link.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.sa_private_link.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.sa_private_link.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_ml_no_local_auth" {
  name = "tnt_ml_no_auth"
  display_name = format("%s %s",data.azurerm_policy_definition.ml_no_local_auth.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.ml_no_local_auth.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.ml_no_local_auth.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_fabric_aad_client_auth" {
  name = "tnt_fa_aad_client_auth"
  display_name = format("%s %s",data.azurerm_policy_definition.fabric_aad_client_auth.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.fabric_aad_client_auth.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.fabric_aad_client_auth.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_audit_custom_rbac_roles" {
  name = "tnt_at_cus_rbac_roles"
  display_name = format("%s %s",data.azurerm_policy_definition.audit_custom_rbac_roles.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.audit_custom_rbac_roles.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.audit_custom_rbac_roles.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_log_analytics_subscription" {
  name = "tnt_log_an_sub"
  display_name = format("%s %s",data.azurerm_policy_definition.log_analytics_subscription.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.log_analytics_subscription.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.log_analytics_subscription.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_additional_email_subscription" {
  name = "tnt_add_email"
  display_name = format("%s %s",data.azurerm_policy_definition.additional_email_subscription.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.additional_email_subscription.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.additional_email_subscription.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_email_high_severity_alerts" {
  name = "tnt_email_high_sev"
  display_name = format("%s %s",data.azurerm_policy_definition.email_high_severity_alerts.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.email_high_severity_alerts.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.email_high_severity_alerts.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_no_forwarding_ip_vm" {
  name = "tnt_no_forwarding_ip_vm"
  display_name = format("%s %s",data.azurerm_policy_definition.no_forwarding_ip_vm.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.no_forwarding_ip_vm.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.no_forwarding_ip_vm.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_vm_jit_management_ports" {
  name = "tnt_vm_jit_ports"
  display_name = format("%s %s",data.azurerm_policy_definition.vm_jit_management_ports.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.vm_jit_management_ports.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.vm_jit_management_ports.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "Disabled"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_vm_management_ports_disabled" {
  name = "tnt_vm_mn_ports_dis"
  display_name = format("%s %s",data.azurerm_policy_definition.vm_management_ports_disabled.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.vm_management_ports_disabled.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.vm_management_ports_disabled.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "Disabled"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_ddos_standard" {
  name = "tnt_ddos_standard"
  display_name = format("%s %s",data.azurerm_policy_definition.ddos_standard.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.ddos_standard.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.ddos_standard.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "Disabled"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_waf_frontdoor" {
  name = "tnt_waf_frontdoor"
  display_name = format("%s %s",data.azurerm_policy_definition.waf_frontdoor.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.waf_frontdoor.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.waf_frontdoor.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_waf_applications_gateway" {
  name = "tnt_waf_app_gw"
  display_name = format("%s %s",data.azurerm_policy_definition.waf_applications_gateway.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.waf_applications_gateway.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.waf_applications_gateway.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_app_service_tls" {
  name = "tnt_app_s_tls"
  display_name = format("%s %s",data.azurerm_policy_definition.app_service_tls.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.app_service_tls.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.app_service_tls.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_function_app_tls" {
  name = "tnt_f_app_tls"
  display_name = format("%s %s",data.azurerm_policy_definition.function_app_tls.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.function_app_tls.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.function_app_tls.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_sa_secure_transfer" {
  name = "tnt_sa_secure_transfer"
  display_name = format("%s %s",data.azurerm_policy_definition.sa_secure_transfer.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.sa_secure_transfer.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.sa_secure_transfer.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_nic_no_public_ip" {
  name = "tnt_nic_no_public_ip"
  display_name = format("%s %s",data.azurerm_policy_definition.nic_no_public_ip.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.nic_no_public_ip.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.nic_no_public_ip.description
} # deny always

resource "azurerm_management_group_policy_assignment" "tnt_kv_firewall_enabled" {
  name = "tnt_kv_firewall_en"
  display_name = format("%s %s",data.azurerm_policy_definition.kv_firewall_enabled.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.kv_firewall_enabled.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.kv_firewall_enabled.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}



resource "azurerm_management_group_policy_assignment" "tnt_location_match" {
  name = "tnt_location_match"
  display_name = format("%s %s",data.azurerm_policy_definition.location_match.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.location_match.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.location_match.description
}


resource "azurerm_management_group_policy_assignment" "tnt_vpn_no_basic_sku" {
  name = "tnt_vpn_no_sku"
  display_name = format("%s %s",data.azurerm_policy_definition.vpn_no_basic_sku.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.vpn_no_basic_sku.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.vpn_no_basic_sku.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_nsg_flow_logs" {
  name = "tnt_nsg_flow_logs"
  display_name = format("%s %s",data.azurerm_policy_definition.nsg_flow_logs.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.nsg_flow_logs.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.nsg_flow_logs.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_sql_transparent_data_encryption" {
  name = "tnt_sql_data_enc"
  display_name = format("%s %s",data.azurerm_policy_definition.sql_transparent_data_encryption.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.sql_transparent_data_encryption.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.sql_transparent_data_encryption.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_ssl_postgres" {
  name =  "tnt_ssl_postgres"
  display_name = format("%s %s",data.azurerm_policy_definition.ssl_postgres.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.ssl_postgres.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.ssl_postgres.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}


# resource "azurerm_management_group_policy_assignment" "tnt_vm_approved_extensions" {
#   name = "tnt_vm_approved_extensions" 
#   display_name = format("%s %s",data.azurerm_policy_definition.vm_approved_extensions.display_name, "Assignment")
#   policy_definition_id = data.azurerm_policy_definition.vm_approved_extensions.id
#   management_group_id = data.azurerm_management_group.example.id
#   description = data.azurerm_policy_definition.vm_approved_extensions.description
#   parameters = <<PARAMETERS
# {
#   "effect": {
#     "value":  "${local.auditeffect}"
#   }
# }
# PARAMETERS
# }


resource "azurerm_management_group_policy_assignment" "tnt_vm_updates" {
  name = "tnt_vm_updates"
  display_name = format("%s %s",data.azurerm_policy_definition.vm_updates.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.vm_updates.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.vm_updates.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_monitor_endpoint_protection" {
  name = "tnt_end_pro"
  display_name = format("%s %s",data.azurerm_policy_definition.monitor_endpoint_protection.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.monitor_endpoint_protection.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.monitor_endpoint_protection.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_kv_deletion_protection" {
  name = "tnt_kv_deletion"
  display_name = format("%s %s",data.azurerm_policy_definition.kv_deletion_protection.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.kv_deletion_protection.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.kv_deletion_protection.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_https_app_service" {
  name = "tnt_https_app_service"
  display_name = format("%s %s",data.azurerm_policy_definition.https_app_service.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.https_app_service.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.https_app_service.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_https_function_app" {
  name = "tnt_https_function_app"
  display_name = format("%s %s",data.azurerm_policy_definition.https_function_app.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.https_function_app.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.https_function_app.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_k8s_https" {
  name = "tnt_k8s_https"
  display_name = format("%s %s",data.azurerm_policy_definition.k8s_https.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.k8s_https.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.k8s_https.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_logs_app_service" {
  name = "tnt_logs_app_service"
  display_name = format("%s %s",data.azurerm_policy_definition.logs_app_service.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.logs_app_service.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.logs_app_service.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_ads_logs" {
  name = "tnt_ads_logs"
  display_name = format("%s %s",data.azurerm_policy_definition.ads_logs.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.ads_logs.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.ads_logs.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_databricks_logs" {
  name = "tnt_databricks_logs"
  display_name = format("%s %s",data.azurerm_policy_definition.databricks_logs.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.databricks_logs.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.databricks_logs.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_k8s_logs" {
  name = "tnt_k8s_logs"
  display_name = format("%s %s",data.azurerm_policy_definition.k8s_logs.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.k8s_logs.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.k8s_logs.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_aml_logs" {
  name = "tnt_aml_logs"
  display_name = format("%s %s",data.azurerm_policy_definition.aml_logs.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.aml_logs.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.aml_logs.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_stream_analytics_logs" {
  name = "tnt_stream_analytics"
  display_name = format("%s %s",data.azurerm_policy_definition.stream_analytics_logs.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.stream_analytics_logs.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.stream_analytics_logs.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_batch_accounts_logs" {
  name = "tnt_batch_logs"
  display_name = format("%s %s",data.azurerm_policy_definition.batch_accounts_logs.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.batch_accounts_logs.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.batch_accounts_logs.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_datalake_logs" {
  name = "tnt_datalake_logs"
  display_name = format("%s %s",data.azurerm_policy_definition.datalake_logs.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.datalake_logs.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.datalake_logs.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_event_hub_logs" {
  name = "tnt_evthub_logs"
  display_name = format("%s %s",data.azurerm_policy_definition.event_hub_logs.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.event_hub_logs.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.event_hub_logs.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_kv_logs" {
  name = "tnt_kv_logs"
  display_name = format("%s %s",data.azurerm_policy_definition.kv_logs.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.kv_logs.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.kv_logs.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_logic_apps_logs" {
  name = "tnt_logic_apps_logs"
  display_name = format("%s %s",data.azurerm_policy_definition.logic_apps_logs.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.logic_apps_logs.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.logic_apps_logs.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_search_services_logs" {
  name = "tnt_search_services_logs"
  display_name = format("%s %s",data.azurerm_policy_definition.search_services_logs.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.search_services_logs.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.search_services_logs.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_service_bus_logs" {
  name = "tnt_service_bus_logs"
  display_name = format("%s %s",data.azurerm_policy_definition.service_bus_logs.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.service_bus_logs.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.service_bus_logs.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_k8s_policy_addon" {
  name = "tnt_k8s_poladd"
  display_name = format("%s %s",data.azurerm_policy_definition.k8s_policy_addon.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.k8s_policy_addon.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.k8s_policy_addon.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_k8s_hostpath" {
  name = "tnt_k8s_hostpath"
  display_name = format("%s %s",data.azurerm_policy_definition.k8s_hostpath.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.k8s_hostpath.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.k8s_hostpath.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_k8s_port_range" {
  name = "tnt_k8s_port_range"
  display_name = format("%s %s",data.azurerm_policy_definition.k8s_port_range.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.k8s_port_range.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.k8s_port_range.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_k8s_no_default_ns" {
  name = "tnt_k8s_ns"
  display_name = format("%s %s",data.azurerm_policy_definition.k8s_no_default_ns.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.k8s_no_default_ns.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.k8s_no_default_ns.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_acr_resolved" {
  name = "tnt_acr_resolved"
  display_name = format("%s %s",data.azurerm_policy_definition.acr_resolved.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.acr_resolved.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.acr_resolved.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_mariadb_no_access" {
  name = "tnt_mariadb_no_access"
  display_name = format("%s %s",data.azurerm_policy_definition.mariadb_no_access.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.mariadb_no_access.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.mariadb_no_access.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditeffect}"
  }
}
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "tnt_mariadb_private_end" {
  name = "tnt_mariadb_private"
  display_name = format("%s %s",data.azurerm_policy_definition.mariadb_private_end.display_name, "Assignment")
  policy_definition_id = data.azurerm_policy_definition.mariadb_private_end.id
  management_group_id = data.azurerm_management_group.example.id
  description = data.azurerm_policy_definition.mariadb_private_end.description
  parameters = <<PARAMETERS
{
  "effect": {
    "value":  "${local.auditIfNotExistsEffect}"
  }
}
PARAMETERS
}


resource "azurerm_management_group_policy_assignment" "tnt_sa_lock_policy" {
  name = "tnt_sa_policy"
  display_name = format("%s %s",azurerm_policy_definition.sa_lock_policy.display_name, "Assignment")
  policy_definition_id = azurerm_policy_definition.sa_lock_policy.id
  management_group_id = data.azurerm_management_group.example.id
  description = azurerm_policy_definition.sa_lock_policy.description
}

resource "azurerm_management_group_policy_assignment" "tnt_mandatory_tags" {
  name = "tnt_mandatory_tags"
  display_name = format("%s %s",azurerm_policy_definition.mandatory_tags.display_name, "Assignment")
  policy_definition_id = azurerm_policy_definition.mandatory_tags.id
  management_group_id = data.azurerm_management_group.example.id
  description = azurerm_policy_definition.mandatory_tags.description
  resource_selectors {
    selectors {
      kind = "resourceType"
      in = ["Microsoft.Resources/subscriptions"]
    }
  }
}

resource "azurerm_management_group_policy_assignment" "tnt_naming_subs" {
  name = "tnt_naming_subs"
  display_name = format("%s %s",azurerm_policy_definition.naming_subscription.display_name, "Assignment")
  policy_definition_id = azurerm_policy_definition.naming_subscription.id
  management_group_id = data.azurerm_management_group.example.id
  description = azurerm_policy_definition.naming_subscription.description
  resource_selectors {
    selectors {
      kind = "resourceType"
      in = ["Microsoft.Resources/subscriptions"]
    }
  }
}

resource "azurerm_management_group_policy_assignment" "tnt_naming_resources2" {
  name = "tnt_naming_resources2"
  display_name = format("%s %s",azurerm_policy_definition.naming_resources_new.display_name, "Assignment")
  policy_definition_id = azurerm_policy_definition.naming_resources_new.id
  management_group_id = data.azurerm_management_group.example.id
  description = azurerm_policy_definition.naming_resources_new.description
  resource_selectors {
    selectors {
      kind = "resourceType"
      not_in = ["Microsoft.Resources/subscriptions", "microsoft.security/pricings", "microsoft.authorization", "microsoft.security/policies", "microsoft.authorization/rolemanagementpolicies", "microsoft.authorization/roleassignments"]
    }
  }
}

resource "azurerm_management_group_policy_assignment" "tnt_mysql_firewall_rules" {
  name = "tnt_msql_firewall_rule"
  display_name = format("%s %s",azurerm_policy_definition.mysql_firewall_rules.display_name, "Assignment")
  policy_definition_id = azurerm_policy_definition.mysql_firewall_rules.id
  management_group_id = data.azurerm_management_group.example.id
  description = azurerm_policy_definition.mysql_firewall_rules.description
}

resource "azurerm_management_group_policy_assignment" "tnt_postgres_firewall_rules" {
  name = "tnt_pg_firewall_rule"
  display_name = format("%s %s",azurerm_policy_definition.postgres_firewall_rules.display_name, "Assignment")
  policy_definition_id = azurerm_policy_definition.postgres_firewall_rules.id
  management_group_id = data.azurerm_management_group.example.id
  description = azurerm_policy_definition.postgres_firewall_rules.description
}

resource "azurerm_management_group_policy_assignment" "tnt_pmariadb_firewall_rules" {
  name = "tnt_mdb_firewall_rule"
  display_name = format("%s %s",azurerm_policy_definition.mariadb_firewall_rules.display_name, "Assignment")
  policy_definition_id = azurerm_policy_definition.mariadb_firewall_rules.id
  management_group_id = data.azurerm_management_group.example.id
  description = azurerm_policy_definition.mariadb_firewall_rules.description
}

resource "azurerm_management_group_policy_assignment" "tnt_vnet_routing" {
  name = "tnt_vnet_routing"
  display_name = format("%s %s",azurerm_policy_definition.vnet_routing.display_name, "Assignment")
  policy_definition_id = azurerm_policy_definition.vnet_routing.id
  management_group_id = data.azurerm_management_group.example.id
  description = azurerm_policy_definition.vnet_routing.description
}