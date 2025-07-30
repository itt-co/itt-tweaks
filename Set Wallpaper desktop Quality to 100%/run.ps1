$registryPath = "HKLM:\System\CurrentControlSet\Control\CrashControl"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[INFO] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "DisplayParameters" -Value 1 -Type DWord
