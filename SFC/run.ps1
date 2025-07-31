Write-Host '[info] This may take a few minutes' -ForegroundColor Cyan
Write-Host "[info] CHKDSK scan..." -ForegroundColor Cyan 
Chkdsk /scan
Write-Host "[info] System File Checker (SFC)..." -ForegroundColor Cyan   
sfc /scannow
Write-Host "[info] DISM RestoreHealth..." -ForegroundColor Cyan   
DISM /Online /Cleanup-Image /Restorehealth
Write-Host "[info] SFC again to verify repairs..." -ForegroundColor Cyan  
sfc /scannow
Add-Log -Message "[INFO] System health check completed" -ForegroundColor Cyan
