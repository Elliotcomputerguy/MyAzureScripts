

# Connect to a linux vm via ssh key
$publicIP = Read-Host 'Enter your pub IP:>'
$pathToPem = Read-Host 'Enter your path to the PEM file'
ssh -i $pathToPem azureuser@$publicIP

