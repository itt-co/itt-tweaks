$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[info] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "DisableWindowsConsumerFeatures" -Value 1 -Type DWord
Write-Host "[info] Restarting explorer." -ForegroundColor Cyan
Stop-Process -processName: Explorer -Force
Start-Sleep -Seconds 1
if (-not (Get-Process -processName: Explorer)) {
    Start-Process explorer.exe
}
