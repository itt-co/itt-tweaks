$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts"
if (Test-Path $registryPath) {
    Write-Host "[info] Removing $registryPath" -ForegroundColor Cyan
    Remove-Item -Path $registryPath -Recurse -Force
} else {
    Write-Host "[info] $registryPath not found, skipping..." -ForegroundColor Yellow
}
