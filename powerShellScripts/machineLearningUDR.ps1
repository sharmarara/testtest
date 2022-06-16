# This script will use to create UDR for Machine Learning

Connect-AzAccount -tenantid ce5330fc-da76-4db0-8b83-9dfdd963f09a
az account set --SubscriptionName Borealis-Brs-t-01
az network route-table route create -g brs-euw-rsg-t-network --route-table-name brs-euw-udr-t-dna-01 -n brs-euw-udr-t-dna-01-to-BatchRoute-w --address-prefix BatchNodeManagement.WestEurope --next-hop-type Internet
az network route-table route create -g brs-euw-rsg-t-network --route-table-name brs-euw-udr-t-dna-01 -n brs-euw-udr-t-dna-01-to-BatchRoute-n --address-prefix BatchNodeManagement.NorthEurope --next-hop-type Internet
az network route-table route create –g brs-euw-rsg-t-network --route-table-name brs-euw-udr-t-dna-01 -n brs-euw-udr-t-dna-01-to-AzureMLRoute --address-prefix AzureMachineLearning --next-hop-type Internet