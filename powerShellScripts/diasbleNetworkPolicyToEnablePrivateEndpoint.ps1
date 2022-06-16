#Connect-AzAccount -tenantid ce5330fc-da76-4db0-8b83-9dfdd963f09a

Select-AzSubscription -SubscriptionName "Borealis-Brs-P-01"
$vnet = Get-AzVirtualNetwork -ResourceGroupName "brs-euw-rsg-p-network" -Name "brs-euw-vnt-p-01"
($vnet | Select -ExpandProperty subnets | ?{$_.Name -eq "brs-euw-snt-p-dna-01"}).PrivateEndpointNetworkPolicies
($vnet | Select -ExpandProperty subnets | ?{$_.Name -eq "brs-euw-snt-p-dna-01"}).PrivateEndpointNetworkPolicies = "Enabled"
$vnet | Set-AzVirtualNetwork