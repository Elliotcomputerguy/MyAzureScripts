
# Source: 
# https://docs.microsoft.com/en-us/azure/governance/management-groups/create-management-group-rest-api

# For PowerShell, use the New-AzManagementGroup cmdlet to create a new management group. In this example, 
# the management group GroupName is Contoso.

New-AzManagementGroup -GroupName 'Contoso'

# The GroupName is a unique identifier being created. This ID is used by other commands to reference this group and 
# it can't be changed later.

# If you want the management group to show a different name within the Azure portal, 
# add the DisplayName parameter. For example, to create a management group with the GroupName 
# of Contoso and the display name of "Contoso Group", use the following cmdlet:

New-AzManagementGroup -GroupName 'Contoso' -DisplayName 'Contoso Group'

# In the preceding examples, the new management group is created under the root management group. 
# To specify a different management group as the parent, use the ParentId parameter.

$parentGroup = Get-AzManagementGroup -GroupName Contoso
New-AzManagementGroup -GroupName 'ContosoSubGroup' -ParentId $parentGroup.id

# To remove the management group created above, use the Remove-AzManagementGroup cmdlet:

Remove-AzManagementGroup -GroupName 'Contoso'

