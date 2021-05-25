
#set tag on resource group. Tags do not apply to the resources.
Set-AzResourceGroup -name '' -tag @{Environment='value'; Dept='value'}

<#
set tags on resources of resource group.
#>
$resourceGroup = Get-AzResourceGroup -name 'name'

Get-AzResource -ResourceGroupName $resourceGroup.ResourceGroupName | ForEach-Object {set-azresource -ResourceId -tag $resourceGroup.Tags -Force}


<#
set tags on resources of all resource groups in the tenancy.
#>

$collection = Get-AzResourceGroup

foreach ($item in $collection) {
    Get-AzResourceGroup -ResourceGroupName $item.ResourceGroupName | foreach-object {Set-AzResource $_.resourceid -tag $item.tags -force}
}