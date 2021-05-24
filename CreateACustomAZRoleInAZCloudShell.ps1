# Create a custom role and convert to Json in cloud shell
# This demo custom role creates a custom role to read and manage vms.
Get-AzRoleDefinition -Name "Reader" | ConvertTo-Json | Out-File $home/clouddrive/ReaderVM.json

# To vscode in azure from cloudshell type in code and pass in the file argument 
# code $home/clouddrive/ReaderVM.Json

<# - Multiline comment
The below jsom template we have removed the id as it will create its own. we have changed the isCustom value to bool true
In actions we have added virtualMachines, we have also added our subscription in assignable scopes.

{
    "Name": "ReaderVM",
    "IsCustom": true,
    "Description": "View all resources, but does not allow you to make any changes, except to vms",
    "Actions": [
      "*/read",
      "Microsoft.Compute/virtualMachines/*"
    ],
    "NotActions": [],
    "DataActions": [],
    "NotDataActions": [],
    "AssignableScopes": [
      "/subscriptions/yoursubid"
    ]
  }

#>

New-AzRoleDefinition -InputFile $home/clouddrive/ReaderVM.json