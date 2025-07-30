$serviceName = "HomeGroupListener"
Write-Host "[INFO] Setting $serviceName startup type to Manual" -ForegroundColor Cyan
Set-Service -Name $serviceName -StartupType Manual

$serviceName = "HomeGroupProvider"
Write-Host "[INFO] Setting $serviceName startup type to Manual" -ForegroundColor Cyan
Set-Service -Name $serviceName -StartupType Manual
