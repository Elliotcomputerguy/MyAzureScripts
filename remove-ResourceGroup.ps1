
# remove resource group without error captures. We can build on this to add multiple resource groups or 
# just resources from resource groups and also check for accidental deletion etc. 

$resourceName = Read-Host 'Enter the name of your resource group to remove:'
Remove-AzureRMresourcegroup -name $resourceName
Write-Host $resourceName + 'has attempted to be removed.'


# remove multiple resources from a resource group.

#Remove-AzResource `
#  -ResourceGroupName ExampleResourceGroup `
#  -ResourceName ExampleVM `
#  -ResourceType Microsoft.Compute/virtualMachines
