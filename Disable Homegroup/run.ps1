$serviceName = "HomeGroupListener"
if (Get-Service -Name $serviceName -ErrorAction SilentlyContinue) {
    Write-Host "[info] Stopping $serviceName" -ForegroundColor Yellow
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    Write-Host "[info] Setting $serviceName startup type to Manual" -ForegroundColor Cyan
    Set-Service -Name $serviceName -StartupType Manual
}

$serviceName = "HomeGroupProvider"
if (Get-Service -Name $serviceName -ErrorAction SilentlyContinue) {
    Write-Host "[info] Stopping $serviceName" -ForegroundColor Yellow
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    Write-Host "[info] Setting $serviceName startup type to Manual" -ForegroundColor Cyan
    Set-Service -Name $serviceName -StartupType Manual
}
