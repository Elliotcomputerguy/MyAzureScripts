

$resourceName = Read-Host 'Enter the name of your resource group to remove:'
# Remove-AzureRmResourceGroup <-- Depreciated and removed 2024
Remove-AzResourceGroup -name $resourceName
Write-Host $resourceName + 'has attempted to be removed.'

# remove multiple resources from a resource group.

Remove-AzResource `
  -ResourceGroupName ExampleResourceGroup `
  -ResourceName ExampleVM `
  -ResourceType Microsoft.Compute/virtualMachines

