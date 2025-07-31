Install-Dependencies 'winget'
winget uninstall 'windows web experience pack' --silent
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[INFO] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "TaskbarDa" -Value 0 -Type DWord

Write-Host "[INFO] Restarting explorer." -ForegroundColor Cyan
Stop-Process -processName: Explorer -Force
Start-Sleep -Seconds 1
if (-not (Get-Process -processName: Explorer)) {
    Start-Process explorer.exe
}
