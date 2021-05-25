
<#
 Obtain the resource ids of the two resources 'resource1/resource2' we are moving from resource group 
'group 1' to resource group 'resourcegrouptomoveto'
#>

$resource_ID1 = Get-AzResource -ResourceGroupName 'group1' -ResourceName 'resource1'

$resource_ID2 = Get-AzResource -ResourceGroupName 'group1' -ResourceName 'resource2'

# move the two resources to resourcegroup 'resourcegroupnametomoveto'
Move-AzResource -DestinationResourceGroupName 'resourcegroupnametomoveto' -ResourceId $resource_ID1.ResourceId, $resource_ID2.ResourceId 