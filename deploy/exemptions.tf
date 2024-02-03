# resource "azurerm_subscription_policy_exemption" "example_asc_default_vm_log_analytics" {
#   name = "asc_og_install_analytics_agent_on_virtual_machine"
#   subscription_id  = data.azurerm_subscription.sandbox.id
#   policy_assignment_id = data.azurerm_subscription_policy_assignment.example_asc_default.id
#   policy_definition_reference_ids = ["installLogAnalyticsAgentOnVmMonitoring"]
#   exemption_category   = "Mitigated"
# }

## fw need to have a Public IP - therefore these exemptions
# resource "azurerm_resource_policy_exemption" "nic_no_pip_waiverACE1" {
#   name = "nic_no_pip_waiverACE1"
#   resource_id  = "${data.azurerm_subscription.example.id}/resourceGroups/ACE-RG-SECURITY/providers/Microsoft.Network/networkinterfaces/acefw0001-nic1"
#   policy_assignment_id = azurerm_management_group_policy_assignment.tnt_nic_no_public_ip.id
#   exemption_category   = "Waiver"
# }
