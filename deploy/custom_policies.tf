## Usage: change the management group id as needed to set the scope

resource "azurerm_policy_definition" "mysql_firewall_rules" {
  name = "MySQL server should have firewall rules"
  display_name = "MySQL server should have firewall rules"
  description = "This policy ensures that firewall rules have been specified for MySQL Database resources."
  management_group_id = data.azurerm_management_group.tenant.id
  policy_type = "Custom"
  mode = "All"

  metadata = <<METADATA
    {
      "category": "SQL"
    }
METADATA

  policy_rule = <<POLICY_RULE
    {
      "if": {
        "field": "type",
        "equals": "Microsoft.DBforMySQL/servers"
      },
      "then": {
        "effect": "auditIfNotExists",
        "details": {
          "type": "Microsoft.DBforMySQL/servers/firewallRules",
          "existenceCondition": {
            "allOf": [
              {
                "field": "Microsoft.DBforMySQL/servers/firewallRules/startIpAddress",
                "exists": "true"
              },
              {
                "field": "Microsoft.DBforMySQL/servers/firewallRules/endIpAddress",
                "exists": "true"
              }
            ]
          }
        }
      }
    }
POLICY_RULE
}

resource "azurerm_policy_definition" "postgres_firewall_rules" {
  name = "PostgreSQL server should have firewall rules"
  display_name = "PostgreSQL server should have firewall rules"
  description = "This policy ensures that firewall rules have been specified for PostgreSQL Database resources."
  management_group_id = data.azurerm_management_group.tenant.id
  policy_type = "Custom"
  mode = "All"

  metadata = <<METADATA
    {
      "category": "SQL"
    }
METADATA

  policy_rule = <<POLICY_RULE
    {
      "if": {
        "field": "type",
        "equals": "Microsoft.DBforPostgreSQL/servers"
      },
      "then": {
        "effect": "auditIfNotExists",
        "details": {
          "type": "Microsoft.DBforPostgreSQL/servers/firewallRules",
          "existenceCondition": {
            "allOf": [
              {
                "field": "Microsoft.DBforPostgreSQL/servers/firewallRules/startIpAddress",
                "exists": "true"
              },
              {
                "field": "Microsoft.DBforPostgreSQL/servers/firewallRules/endIpAddress",
                "exists": "true"
              }
            ]
          }
        }
      }
    }
POLICY_RULE
}

resource "azurerm_policy_definition" "mariadb_firewall_rules" {
  name = "MariaDB server should have firewall rules"
  display_name = "MariaDB server should have firewall rules"
  description = "This policy ensures that firewall rules have been specified for MariaDB Database resources."
  management_group_id = data.azurerm_management_group.tenant.id
  policy_type = "Custom"
  mode = "All"

  metadata = <<METADATA
    {
      "category": "SQL"
    }
METADATA

  policy_rule = <<POLICY_RULE
    {
      "if": {
        "field": "type",
        "equals": "Microsoft.DBforMariaDB/servers"
      },
      "then": {
        "effect": "auditIfNotExists",
        "details": {
          "type": "Microsoft.DBforMariaDB/servers/firewallRules",
          "existenceCondition": {
            "allOf": [
              {
                "field": "Microsoft.DBforMariaDB/servers/firewallRules/startIpAddress",
                "exists": "true"
              },
              {
                "field": "Microsoft.DBforMariaDB/servers/firewallRules/endIpAddress",
                "exists": "true"
              }
            ]
          }
        }
      }
    }
POLICY_RULE
}

resource "azurerm_policy_definition" "sa_lock_policy" {
  name         = "Storage Account Lock"
  display_name = "Ensure Storage Accounts have locks enabled"
  description  = "This policy ensures that all Azure Storage Accounts have locks enabled."
  management_group_id = data.azurerm_management_group.tenant.id
  policy_type = "Custom"
  mode = "All"

  metadata = <<METADATA
    {
      "category": "Locks"
    }
METADATA

  policy_rule = <<POLICY_RULE
{
  "if": {
      "field": "type",
      "equals": "Microsoft.Storage/storageAccounts"
  },
  "then": {
      "effect": "AuditIfNotExists",
      "details": {
          "type": "Microsoft.Authorization/locks",
          "existenceCondition": {
              "field": "Microsoft.Authorization/locks/level",
              "equals": "CanNotDelete"
            } 
        }
    }
  }
  POLICY_RULE
}

## define a custom azure policy to enforce the tags team and app for resources
resource "azurerm_policy_definition" "mandatory_tags" {
    name = "Mandatory Tags Custom"
    display_name = "Mandatory Tags Custom"
    description = "Force all Teams to set needed Tags for the Azure Resources"
    management_group_id = data.azurerm_management_group.tenant.id
    policy_type = "Custom"
    mode = "Indexed" ## all Resources which support tags and locations are audited
    metadata = <<METADATA
        {
            "category" : "Tags"
        }
    METADATA

    ## checking for the tags in all resources
    ## change "effect" from audit to deny to enforce the tags during creation
    policy_rule = <<POLICY_RULE
    {
        "if": {
            "anyOf": [
                {
                    "field": "tags.CostCenter",
                    "exists": "false"
                },
                {
                    "field": "tags.Description",
                    "exists": "false"
                },
                {
                    "field": "tags.BusinessContact",
                    "exists": "false"
                },
                {
                    "field": "tags.TechnicalContact",
                    "exists": "false"
                },
                {
                    "field": "tags.Department",
                    "exists": "false"
                }
            ]   
        },
        "then": {
            "effect" : "Audit"  
        }
    }
    POLICY_RULE

}


# define the naming convention for all resources in Custom 
# using wildcards: # for a single digit, ? for a single letter and * for general wildcard
resource "azurerm_policy_definition" "naming_subscription" {
    name = "Naming Convention Subscriptions Custom"
    display_name = "Naming Convention Subscriptions Custom"
    description = "Force all Teams apply the naming convention to the Azure Subscriptions"
    management_group_id = data.azurerm_management_group.tenant.id
    policy_type = "Custom"
    mode = "All" ## all Resources should be affected
    metadata = <<METADATA
        {
            "category" : "Naming"
        }
    METADATA

    policy_rule = <<POLICY_RULE
    {
      "if": {
        "allOf": [
          {
            "not": {
              "field": "name",
              "match": "FI-?_*" 
            }
          },
          {
            "field": "type",
            "equals": "Microsoft.Subscription"
          }
        ]
      },
      "then": {
        "effect": "Audit"
      }
    }
    POLICY_RULE
}

## assuming a naming convention for resources, consisting of allowedLocations, and allowedResources
# example: aewstprod001 or aew-vm-prod-001
# aewprod001 would be audited here
# using abbrevations from this microsoft link: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations
resource "azurerm_policy_definition" "naming_resources_new" {
    name = "Naming Convention for Resources Custom"
    display_name = "Naming Convention for Resources Custom"
    description = "Force all Teams apply the naming convention to the Azure Resources"
    management_group_id = data.azurerm_management_group.tenant.id
    policy_type = "Custom"
    mode = "All" ## all Resources should be affected
    metadata = <<METADATA
        {
            "category" : "Naming"
        }
    METADATA

    parameters = <<PARAMETERS
    {
        "allowedLocations": {
            "type": "Array",
            "metadata": {
                "description": "The list of allowed abbr locations for naming of resources.",
                "displayName": "Allowed locations"
            },
            "allowedValues": [
              "aew",
              "aue",
              "ace"
            ],
            "defaultValue": [
              "aew",
              "aue",
              "ace"
            ]
        },
        "allowedResources": {
            "type": "Array",
            "metadata": {
                "description": "The list of allowed resource abbreviations for naming.",
                "displayName": "Allowed resources"
            },
            "allowedValues": [
              "vm",
              "srch",
              "cog",
              "mlw",
              "as",
              "dbw",
              "dec",
              "dedb",
              "adf",
              "dt",
              "asa",
              "synw",
              "syndp",
              "synsp",
              "dls",
              "dla",
              "evhns",
              "evh",
              "egst",
              "hadoop",
              "hbase",
              "kafka",
              "storm",
              "spark",
              "mls",
              "iot",
              "provs",
              "pcert",
              "pbi",
              "tsi",
              "ase",
              "asp",
              "lt",
              "avail",
              "arcs",
              "arck",
              "ba",
              "cld",
              "acs",
              "des",
              "func",
              "gal",
              "host",
              "it",
              "osdisk",
              "disk",
              "ntf",
              "ntfns",
              "ppg",
              "snap",
              "stapp",
              "vmss",
              "mc",
              "stvm",
              "app",
              "aks",
              "ca",
              "cae",
              "cr",
              "ci",
              "sf",
              "sfmc",
              "cosmos",
              "coscas",
              "cosmon",
              "cosno",
              "costab",
              "cosgrm",
              "cospos",
              "redis",
              "sql",
              "sqldb",
              "sqlja",
              "sqlep",
              "maria",
              "mariadb",
              "mysql",
              "psql",
              "sqlstrdb",
              "sqlmi",
              "appcs",
              "map",
              "sigr",
              "wps",
              "amg",
              "apim",
              "ia",
              "logic",
              "sbns",
              "sbq",
              "sbt",
              "sbts",
              "aa",
              "appi",
              "ag",
              "dcr",
              "bp",
              "bpa",
              "log",
              "pack",
              "mg",
              "pview",
              "rg",
              "ts",
              "migr",
              "dms",
              "rsv",
              "agw",
              "asg",
              "cdnp",
              "cdne",
              "con",
              "dnspr",
              "in",
              "out",
              "afw",
              "afwp",
              "erc",
              "afd",
              "fde",
              "fdfp",
              "lbi",
              "lbe",
              "rule",
              "lgw",
              "ng",
              "nic",
              "nsg",
              "nsgsr",
              "nw",
              "pl",
              "pep",
              "pip",
              "ippre",
              "rf",
              "rtserv",
              "se",
              "traf",
              "udr",
              "vnet",
              "vgw",
              "vnm",
              "peer",
              "snet",
              "vwan",
              "vhub",
              "ssimp",
              "bvault",
              "bkpol",
              "share",
              "st",
              "sss",
              "vdpool",
              "vdag",
              "vdws",
              "vdscaling",
              "sqldw"
            ],
            "defaultValue": [
              "vm",
              "srch",
              "cog",
              "mlw",
              "as",
              "dbw",
              "dec",
              "dedb",
              "adf",
              "dt",
              "asa",
              "synw",
              "syndp",
              "synsp",
              "dls",
              "dla",
              "evhns",
              "evh",
              "egst",
              "hadoop",
              "hbase",
              "kafka",
              "storm",
              "spark",
              "mls",
              "iot",
              "provs",
              "pcert",
              "pbi",
              "tsi",
              "ase",
              "asp",
              "lt",
              "avail",
              "arcs",
              "arck",
              "ba",
              "cld",
              "acs",
              "des",
              "func",
              "gal",
              "host",
              "it",
              "osdisk",
              "disk",
              "ntf",
              "ntfns",
              "ppg",
              "snap",
              "stapp",
              "vmss",
              "mc",
              "stvm",
              "app",
              "aks",
              "ca",
              "cae",
              "cr",
              "ci",
              "sf",
              "sfmc",
              "cosmos",
              "coscas",
              "cosmon",
              "cosno",
              "costab",
              "cosgrm",
              "cospos",
              "redis",
              "sql",
              "sqldb",
              "sqlja",
              "sqlep",
              "maria",
              "mariadb",
              "mysql",
              "psql",
              "sqlstrdb",
              "sqlmi",
              "appcs",
              "map",
              "sigr",
              "wps",
              "amg",
              "apim",
              "ia",
              "logic",
              "sbns",
              "sbq",
              "sbt",
              "sbts",
              "aa",
              "appi",
              "ag",
              "dcr",
              "bp",
              "bpa",
              "log",
              "pack",
              "mg",
              "pview",
              "rg",
              "ts",
              "migr",
              "dms",
              "rsv",
              "agw",
              "asg",
              "cdnp",
              "cdne",
              "con",
              "dnspr",
              "in",
              "out",
              "afw",
              "afwp",
              "erc",
              "afd",
              "fde",
              "fdfp",
              "lbi",
              "lbe",
              "rule",
              "lgw",
              "ng",
              "nic",
              "nsg",
              "nsgsr",
              "nw",
              "pl",
              "pep",
              "pip",
              "ippre",
              "rf",
              "rtserv",
              "se",
              "traf",
              "udr",
              "vnet",
              "vgw",
              "vnm",
              "peer",
              "snet",
              "vwan",
              "vhub",
              "ssimp",
              "bvault",
              "bkpol",
              "share",
              "st",
              "sss",
              "vdpool",
              "vdag",
              "vdws",
              "vdscaling",
              "sqldw"
            ]
        }
    }
PARAMETERS
    policy_rule = <<POLICY_RULE
    {
      "if": {
        "anyOf": [
          {
            "value": "[if(greaterOrEquals(length(field('name')), 5), substring(field('name'), 0, 3), 'not starting with region')]",
            "notIn": "[parameters('allowedLocations')]"
          },
          {
            "not": {
              "anyOf": [
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 5), substring(field('name'), 3, 2), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 6), substring(field('name'), 3, 3), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 7), substring(field('name'), 3, 4), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 8), substring(field('name'), 3, 5), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 9), substring(field('name'), 3, 6), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 10), substring(field('name'), 3, 7), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 11), substring(field('name'), 3, 8), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 12), substring(field('name'), 3, 9), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 7), substring(field('name'), 4, 2), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 8), substring(field('name'), 4, 3), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 9), substring(field('name'), 4, 4), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 10), substring(field('name'), 4, 5), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 11), substring(field('name'), 4, 6), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 12), substring(field('name'), 4, 7), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 13), substring(field('name'), 4, 8), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                },
                {
                  "value": "[if(greaterOrEquals(length(field('name')), 14), substring(field('name'), 4, 9), 'not part of allowed types')]",
                  "in": "[parameters('allowedResources')]"
                }
              ]
            }
          }
        ]
    },
    "then": {
      "effect": "audit"
    }
  }
  POLICY_RULE
}

# enforce for all teams using vnets, that a custom routing is enabled and set
resource "azurerm_policy_definition" "vnet_routing" {
    name = "Enforce Routing VNET"
    display_name = "Enforce Routing VNET"
    description = "Force all Teams to set a custom routing table for the VNETs"
    management_group_id = data.azurerm_management_group.tenant.id
    policy_type = "Custom"
    mode = "All" ## all Resources should be affected
    metadata = <<METADATA
        {
            "category" : "VNets"
        }
    METADATA

    ## check if type is VNET and field routeTable exists, then audit 
    policy_rule = <<POLICY_RULE
    {
      "if": {
				"anyOf": [
					{
						"allOf": [
							{
								"field": "type",
								"equals": "Microsoft.Network/virtualNetworks"
							},
							{
								"not": {
									"field": "Microsoft.Network/virtualNetworks/subnets[*].routeTable.id",
									"exists": "false"
								}
							}
						]
					},
					{
						"allOf": [
							{
								"field": "type",
								"equals": "Microsoft.Network/virtualNetworks/subnets"
							},
							{
								"not": {
									"field": "Microsoft.Network/virtualNetworks/subnets/routeTable.id",
									"exists": "false"
								}
							}
						]
					}
				]
			},
			"then": {
				"effect": "Audit"
			}
    }
    POLICY_RULE
}