
# Create resource group
New-AzResourceGroup -name 'name' -location 'location' 

# Create resource group with lock

New-AzResourceGroup -name 'name' -Location 'location'
New-AzResourceLock -LockName 'name' -LockLevel CanNotDelete -ResourceGroupName 'name'
