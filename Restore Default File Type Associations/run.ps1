$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts"
if (Test-Path $registryPath) {
    Write-Host "[INFO] Removing $registryPath" -ForegroundColor Cyan
    Remove-Item -Path $registryPath -Recurse -Force
} else {
    Write-Host "[INFO] $registryPath not found, skipping..." -ForegroundColor Yellow
}
