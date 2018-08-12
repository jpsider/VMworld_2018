$vm = $Args[0]

Get-VM | % { Start-VM }

Get-VM | ForEach-Object { Start-VM }

$vm = Get-VM -VM "SomeName"
if($vm -eq $null) { Write-Host "No VM found" } else {Write-Host "Oh, Hey The VM exists!"}


$vm = Get-VM -VM "SomeName"
if($null -eq $vm) 
{ 
    Write-Host "No VM found" 
} 
else 
{
    Write-Host "Oh, Hey The VM exists!"
}

$Cluster = Get-Cluster
if ($Cluster = "Production") {
    Write-Output "Do Production Stuff"
} elseif ($Cluster = "Pre-Prod") {
    Write-Output "Do Pre-Prod Stuff"
} elseif ($Cluster = "Development") {
    Write-Output "Do Development Stuff"
} elseif ($Cluster = "Infrastructure") {
    Write-Output "Do Infrastructure Stuff"
} else {
    Write-Output "Cluster Not found"
}

$Cluster = Get-Cluster
switch ($Cluster) {
    Production { Write-Output "Do Production Stuff" }
    Pre-Prod { Write-Output "Do Pre-Prod Stuff" }
    Development { Write-Output "Do Development Stuff" }
    Infrastructure { Write-Output "Do Infrastructure Stuff" }
    Default { Write-Output "Cluster Not found" }
}

Invoke-ScriptAnalyzer -Path .\Private\Confirm-vCenter.ps1
Invoke-ScriptAnalyzer -Path . -Recurse