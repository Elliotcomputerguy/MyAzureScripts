


# https://docs.microsoft.com/en-us/powershell/module/azuread/new-azureaduser?view=azureadps-2.0

$pwprofile = New-Object -Type Microsoft.Open.AzureAD.Model.PasswordProfile
$pwprofile.password = 'YourPassword'

New-AzureADUser -AccountEnabled $true -PasswordProfile -DisplayName 'user Display name' -UserPrincipalName 'username@emaildomain' `
-MailNickName 'user nick name'

