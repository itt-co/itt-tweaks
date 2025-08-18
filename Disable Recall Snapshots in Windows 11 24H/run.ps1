$registryPath = "HKCU:\Software\Policies\Microsoft\Windows\WindowsAI"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "DisableAIDataAnalysis" -Value 1 -Type DWord

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "DisableAIDataAnalysis" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "AllowRecallEnablement" -Value 0 -Type DWord
