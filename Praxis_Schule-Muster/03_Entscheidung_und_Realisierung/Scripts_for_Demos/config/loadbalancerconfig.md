# Config Loadbalancer

```JSON
{
    "name": "az-lb-sm-1",
    "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/loadBalancers/az-lb-sm-1",
    "etag": "W/\"71cd2464-9538-48f0-93af-36f5676be51b\"",
    "type": "Microsoft.Network/loadBalancers",
    "location": "westus",
    "properties": {
        "provisioningState": "Succeeded",
        "resourceGuid": "b81cf145-0406-464c-b02f-d560b8da6fe1",
        "frontendIPConfigurations": [
            {
                "name": "SMFrontEnd",
                "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/loadBalancers/az-lb-sm-1/frontendIPConfigurations/SMFrontEnd",
                "etag": "W/\"71cd2464-9538-48f0-93af-36f5676be51b\"",
                "type": "Microsoft.Network/loadBalancers/frontendIPConfigurations",
                "properties": {
                    "provisioningState": "Succeeded",
                    "privateIPAllocationMethod": "Dynamic",
                    "publicIPAddress": {
                        "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/publicIPAddresses/SMPublicIP"
                    },
                    "loadBalancingRules": [
                        {
                            "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/loadBalancers/az-lb-sm-1/loadBalancingRules/SMLoadBalancerRule"
                        }
                    ]
                }
            }
        ],
        "backendAddressPools": [
            {
                "name": "SMBackEndPool",
                "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/loadBalancers/az-lb-sm-1/backendAddressPools/SMBackEndPool",
                "etag": "W/\"71cd2464-9538-48f0-93af-36f5676be51b\"",
                "properties": {
                    "provisioningState": "Succeeded",
                    "loadBalancerBackendAddresses": [
                        {
                            "name": "az-rg-sm-srv-homepage_webNic2ipconfig1",
                            "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/loadBalancers/az-lb-sm-1/backendAddressPools/SMBackEndPool/loadBalancerBackendAddresses/az-rg-sm-srv-homepage_webNic2ipconfig1",
                            "etag": "W/\"71cd2464-9538-48f0-93af-36f5676be51b\"",
                            "properties": {
                                "provisioningState": "Succeeded",
                                "networkInterfaceIPConfiguration": {
                                    "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/networkInterfaces/webNic2/ipConfigurations/ipconfig1"
                                }
                            },
                            "type": "Microsoft.Network/loadBalancers/backendAddressPools/loadBalancerBackendAddresses"
                        },
                        {
                            "name": "az-rg-sm-srv-homepage_webNic1ipconfig1",
                            "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/loadBalancers/az-lb-sm-1/backendAddressPools/SMBackEndPool/loadBalancerBackendAddresses/az-rg-sm-srv-homepage_webNic1ipconfig1",
                            "etag": "W/\"71cd2464-9538-48f0-93af-36f5676be51b\"",
                            "properties": {
                                "provisioningState": "Succeeded",
                                "networkInterfaceIPConfiguration": {
                                    "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/networkInterfaces/webNic1/ipConfigurations/ipconfig1"
                                }
                            },
                            "type": "Microsoft.Network/loadBalancers/backendAddressPools/loadBalancerBackendAddresses"
                        }
                    ],
                    "backendIPConfigurations": [
                        {
                            "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/networkInterfaces/webNic2/ipConfigurations/ipconfig1"
                        },
                        {
                            "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/networkInterfaces/webNic1/ipConfigurations/ipconfig1"
                        }
                    ],
                    "loadBalancingRules": [
                        {
                            "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/loadBalancers/az-lb-sm-1/loadBalancingRules/SMLoadBalancerRule"
                        }
                    ]
                },
                "type": "Microsoft.Network/loadBalancers/backendAddressPools"
            }
        ],
        "loadBalancingRules": [
            {
                "name": "SMLoadBalancerRule",
                "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/loadBalancers/az-lb-sm-1/loadBalancingRules/SMLoadBalancerRule",
                "etag": "W/\"71cd2464-9538-48f0-93af-36f5676be51b\"",
                "type": "Microsoft.Network/loadBalancers/loadBalancingRules",
                "properties": {
                    "provisioningState": "Succeeded",
                    "frontendIPConfiguration": {
                        "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/loadBalancers/az-lb-sm-1/frontendIPConfigurations/SMFrontEnd"
                    },
                    "frontendPort": 80,
                    "backendPort": 80,
                    "enableFloatingIP": false,
                    "idleTimeoutInMinutes": 4,
                    "protocol": "Tcp",
                    "enableDestinationServiceEndpoint": false,
                    "enableTcpReset": false,
                    "allowBackendPortConflict": false,
                    "loadDistribution": "Default",
                    "disableOutboundSnat": false,
                    "backendAddressPool": {
                        "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/loadBalancers/az-lb-sm-1/backendAddressPools/SMBackEndPool"
                    },
                    "backendAddressPools": [
                        {
                            "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/loadBalancers/az-lb-sm-1/backendAddressPools/SMBackEndPool"
                        }
                    ],
                    "probe": {
                        "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/loadBalancers/az-lb-sm-1/probes/SMHealthProbe"
                    }
                }
            }
        ],
        "probes": [
            {
                "name": "SMHealthProbe",
                "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/loadBalancers/az-lb-sm-1/probes/SMHealthProbe",
                "etag": "W/\"71cd2464-9538-48f0-93af-36f5676be51b\"",
                "properties": {
                    "provisioningState": "Succeeded",
                    "protocol": "Http",
                    "port": 80,
                    "requestPath": "/",
                    "intervalInSeconds": 5,
                    "numberOfProbes": 2,
                    "loadBalancingRules": [
                        {
                            "id": "/subscriptions/2b300788-6f75-4d7e-ad1a-cf02b57283ea/resourceGroups/az-rg-sm-srv-homepage/providers/Microsoft.Network/loadBalancers/az-lb-sm-1/loadBalancingRules/SMLoadBalancerRule"
                        }
                    ]
                },
                "type": "Microsoft.Network/loadBalancers/probes"
            }
        ],
        "inboundNatRules": [],
        "outboundRules": [],
        "inboundNatPools": []
    },
    "sku": {
        "name": "Standard",
        "tier": "Regional"
    }
}
```