# TF-TEST

it's a simple project to learn terraform from stractch 
,
    {
      "mode": "managed",
      "type": "azurerm_subnet",
      "name": "SNT-TF1",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "address_prefix": "10.1.0.0/24",
            "address_prefixes": [
              "10.1.0.0/24"
            ],
            "delegation": [],
            "enforce_private_link_endpoint_network_policies": false,
            "enforce_private_link_service_network_policies": false,
            "id": "/subscriptions/bc6eadfd-393d-4e9e-8140-4fe9bfd772fc/resourceGroups/azrgpsoan0001/providers/Microsoft.Network/virtualNetworks/myrg-3-vnet/subnets/default",
            "name": "default",
            "resource_group_name": "azrgpsoan0001",
            "service_endpoint_policy_ids": null,
            "service_endpoints": null,
            "timeouts": null,
            "virtual_network_name": "myrg-3-vnet"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoxODAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_resource_group.RG-TF1",
            "azurerm_virtual_network.VNT-TF1"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_virtual_network",
      "name": "VNT-TF1",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "address_space": [
              "10.1.0.0/16"
            ],
            "bgp_community": "",
            "ddos_protection_plan": [],
            "dns_servers": [],
            "guid": "9f89926d-1445-4dfc-ac0f-af0a2ba93928",
            "id": "/subscriptions/bc6eadfd-393d-4e9e-8140-4fe9bfd772fc/resourceGroups/azrgpsoan0001/providers/Microsoft.Network/virtualNetworks/myrg-3-vnet",
            "location": "westeurope",
            "name": "myrg-3-vnet",
            "resource_group_name": "azrgpsoan0001",
            "subnet": [],
            "tags": null,
            "timeouts": null,
            "vm_protection_enabled": false
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoxODAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_resource_group.RG-TF1"
          ]
        }
      ]
    }