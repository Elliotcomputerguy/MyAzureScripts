## resource group
# ---------------------------------------------------
# Idenitfy tags assigned to a resource group.
(Get-AzResourceGroup -Name examplegroup).Tags
# set tag on resource group. Tags do not apply to the resources. This will over write any existing tags.
Set-AzResourceGroup -name '' -tag @{Environment='value'; Dept='value'}
# Add a tag to a resource group that has existing tags. This will not overwrite the existing tags. No resources in the resource
# group will be tagged. Only the resource group.
$tags = (Get-AzResourceGroup -Name examplegroup).Tags
$tags.Add("Env", "Dept")
Set-AzResourceGroup -Tag $tags -Name examplegroup

## Resource
# -------------------------------------------------------------------------------
#Identify tags of a single resource
(Get-AzResource -ResourceName examplevnet -ResourceGroupName examplegroup).Tags
#Add tag to a resource with no existing tags. Any existing tags will be overwritten
$tag = Get-AzResource -ResourceName examplevnet -ResourceGroupName examplegroup
Set-AzResource -Tag @{ Dept="IT"; Environment="Test" } -ResourceId $tag.ResourceId -Force
#Add tag to a resource with existing tags. This will add a tag without overwriting any other assigned tags 
$tag = Get-AzResource -ResourceName examplevnet -ResourceGroupName examplegroup
$tag.Tags.Add("Status", "Approved")
Set-AzResource -Tag $tag.Tags -ResourceId $tag.ResourceId -Force
# set tags on resources of resource group. This will overwrite any existing tags.
$resourceGroup = Get-AzResourceGroup -name 'name'
Get-AzResource -ResourceGroupName $resourceGroup.ResourceGroupName | ForEach-Object {set-azresource -ResourceId -tag $resourceGroup.Tags -Force}
# set tags on resources of all resource groups in the tenancy.
$collection = Get-AzResourceGroup
foreach ($item in $collection) {
    Get-AzResourceGroup -ResourceGroupName $item.ResourceGroupName | foreach-object {Set-AzResource $_.resourceid -tag $item.tags -force}
}
