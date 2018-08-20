$auth = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("administrator" + ':' + "VMware1!"))

$headers = @{
    'Authorization' = "Basic $auth"
}

$Token = (Invoke-RestMethod -Uri https://$vCenter/rest/com/vmware/cis/session -Method Post -Headers $headers -UseBasicParsing).value
$Token

$Headers = @{'vmware-api-session-id' = $Token}

$RawData = Invoke-RestMethod -Uri https://$vCenter/rest/vcenter/vm -Method Get -Headers $Headers
$RawData.value | format-table

$RawData.value | Format-Table Name, Power_State, cpu_count, Memory_size_MiB -AutoSize

Install-Module -Name PowerRestCLI
Import-Module -Name PowerRestCLI
$vcenter = "192.168.2.220"
# This will prompt you for Credentials
Connect-rVIServer -vCenter $vCenter
Get-rVM -vCenter $vcenter