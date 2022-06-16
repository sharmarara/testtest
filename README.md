# Introduction 
TODO: 
This repo is created as part of the Borealis foundation project. The repo has ARM templates for deploying the infrastructure using Azure devops piples.

# Getting Started
TODO: Guide users through getting your code up and running on their own system. In this section you can talk about:
1.	Folder structure in place for each spoke subscription and all the parameter files are available in the respective folder.

2.  There are release pipelines created as below 
    Release pipe line for each spokes (BRS,CES,POS and Trasit-Hub and Hub). 
    VM provisioning / Diagnostics Storage account / Install agents    
    New subnet creation

3.	Dependencies/Limitiations 
    Any new requests for the user defined routes to be applied using the Azure portal and the same needs to be updated in Azure Repo template specific to the spoke. There is a limitation in Azure when Virtual network related resources are deployed, all the child resources to be referenced to avoid any deletion of the existing resources. This also deletes and recreates resources like (NSG, UDR, service endpoint) and removes any association if not explicitly given in template which will cause network disruption during the process. This is a known issue (reference github issue https://github.com/Azure/azure-quickstart-templates/issues/2786) 

    Adding new public IP to the Azure load balancer, for any new request for adding a Public IP to the load balancer, ensure to refer all the existing public IPs assigned to the load balancer if not done so, the existing Public IP references will be removed from Load balancer. Refer to the Azure Repos > Hub-Deployment > Azure monitor > Azuremonitor-pip.deploy.json and Azuremonitor-pip.parameters.deploy.json 

    Azure firewall adding network rules, for add/remove rules, ensure to check if all the existing rules are available in the update/delete network rules template Azure Repos>Transit-Hub-Spoke>Transit-hub-azfw-rules-add-remove.paramaters.deploy.json and Trasnit-hub-azfw-rules-add-remove.deploy.json. . Any missing rules in the template will be removed as part of the deployment. 
    

# Build and Test
TODO: Describe and show how to build your code and run the tests. 

# Contribute
TODO: Explain how other users and developers can contribute to make your code better. 

If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops). You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)