{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "virtualMachineAdminUserName": {
            "reference": {
                "keyVault": {
                    "id": "/subscriptions/c2242621-293d-4604-918a-42718bca43b8/resourceGroups/brh-euw-rsg-p-hub-keyv/providers/Microsoft.KeyVault/vaults/brh-euw-kv-p-hub-mgmt-01"
                },
                "secretName": "vmadminusername"
            }
        },
        "virtualMachineAdminPassword": {
            "reference": {
                "keyVault": {
                    "id": "/subscriptions/c2242621-293d-4604-918a-42718bca43b8/resourceGroups/brh-euw-rsg-p-hub-keyv/providers/Microsoft.KeyVault/vaults/brh-euw-kv-p-hub-mgmt-01"
                },
                "secretName": "vmadminpassword"
            }
        },
        "VirtualMachineName": {
            "value": [
                "brseuwswtts01"
            ]
        },
        "virtualMachineSize": {
            "value": "Standard_DS2_v2"
        },
        "noOfDataDisk": {
            "value": 0
        },
        "dataDiskSize": {
            "value": 100
        },
        "SharedImageGalleryResourceGroupName": {
            "value": "brh-euw-rsg-p-hub-goldenimage"
        },
        "galleryName": {
            "value": "brheuwsigp01"
        },
        "galleryImageDefinitionName": {
            "value": "brh-euw-sigvm-p-hub-w2019"
        },
        "galleryImageVersionName": {
            "value": "0.0.1"
        },
        "EnableAcceleratedNetworking": {
            "value": false
        },
        "storageAccountName": {
            "value": "brseuwstotdiagacct01"
        },
        "storageAccountResourceGroupName": {
            "value": "brs-euw-rsg-t-diagsto"
        },
        "existingVirtualNetworkName": {
            "value": "brs-euw-vnt-t-01"
        },
        "existingVirtualNetworkResourceGroup": {
            "value": "brs-euw-rsg-t-network"
        },
        "Infra-SubnetName": {
            "value": "brs-euw-snt-t-rpa"
        },
        "location": {
            "value": "West Europe"
        },
        "domainJoinUserName": {
            "value": "mignetwork\\altirisimport"
        },
        "domainFQDN": {
            "value": "mignetwork.net"
        },
        "domainJoinUserPassword": {
            "reference": {
                "keyVault": {
                    "id": "/subscriptions/c2242621-293d-4604-918a-42718bca43b8/resourceGroups/brh-euw-rsg-p-hub-keyv/providers/Microsoft.KeyVault/vaults/brh-euw-kv-p-hub-mgmt-01"
                },
                "secretName": "DomainJoinPassword"
            }
        },
        "Availabilityzone": {
            "value": [
                "1"
            ]
        },
        "Ostype": {
            "value": "Windows"
        }

    }
}