################# Azure Blob Storage - PowerShell ####################  
 
## Input Parameters  
$resourceGroupName="brh-euw-rsg-p-hub-goldenimage"  
$storageAccName="brheuwstopvmcse002"  
$downloadPath=""  
$downloadLocation=""    
 
## Connect to Azure Account  
Connect-AzAccount -TenantId ce5330fc-da76-4db0-8b83-9dfdd963f09a
Set-AzContext -Subscription "BorealisHUB"
 
## Function to dlownload all blob contents  
Function DownloadBlobContents  
{  
    Write-Host -ForegroundColor Green "Download blob contents from storage container.."    
    ## Get the storage account  
    $storageAcc=Get-AzStorageAccount -ResourceGroupName $resourceGroupName -StorageAccountName $storageAccName     
    ## Get the storage account context  
    $ctx=$storageAcc.Context  
    ## Get all the containers  
    $containers=Get-AzStorageContainer  -Context $ctx   
    ## Loop through the containers  
    foreach($container in $containers)  
    {          
        ## check if folder exists  
        $folderPath=$downloadPath+"\"+$container.Name  
        $destination=$downloadLocation+"\"+$container.Name  
        $folderExists=Test-Path -Path $folderPath  
        if($folderExists)  
        {  
            Write-Host -ForegroundColor Magenta $container.Name "- folder exists"  
            ## Get the blob contents from the container  
            $blobContents=Get-AzStorageBlob -Container $container.Name  -Context $ctx  
            foreach($blobContent in $blobContents)  
            {  
                ## Download the blob content  
                Get-AzStorageBlobContent -Container $container.Name  -Context $ctx -Blob $blobContent.Name -Destination $destination -Force  
            }  
        }  
        else  
        {        
            Write-Host -ForegroundColor Magenta $container.Name "- folder does not exist"  
            ## Create the new folder  
            New-Item -ItemType Directory -Path $folderPath  
            ## Get the blob contents from the container  
            $blobContents=Get-AzStorageBlob -Container $container.Name  -Context $ctx  
            foreach($blobContent in $blobContents)  
            {  
                ## Download the blob content  
                Get-AzStorageBlobContent -Container $container.Name  -Context $ctx -Blob $blobContent.Name -Destination $destination -Force  
            }  
        }  
    }     
}   
  
DownloadBlobContents  
 
## Disconnect from Azure Account  
Disconnect-AzAccount  