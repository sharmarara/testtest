Set-AzContext -SubscriptionID '2c9eacc5-e79a-4b5d-93fa-2565e94b9d0d'
$RGNameToDeploy='brs-euw-rsg-p-network'

$location='west europe'

 

#Check Resource Group Exists or not. If not then will create new one....

Write-Host "Checking if the RG exists.." -ForegroundColor Yellow

Get-AzResourceGroup -Name $RGNameToDeploy -ErrorVariable notPresent -ErrorAction SilentlyContinue

 

  if ($notPresent){

    # ResourceGroup doesn't exist

    # Hence create a new one

    New-AzResourceGroup -Name $RGNameToDeploy -Location $location -Verbose

    Write-Host "RG Created.." -ForegroundColor Green

  }

else {

    # ResourceGroup exist - do nothing.. continue

    Write-Host "RG already exists.." -ForegroundColor Yellow

  } 