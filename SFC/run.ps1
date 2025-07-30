Write-Host '[INFO] This may take a few minutes' -ForegroundColor Cyan
Write-Host "[INFO] CHKDSK scan..." -ForegroundColor Cyan 
Chkdsk /scan
Write-Host "[INFO] System File Checker (SFC)..." -ForegroundColor Cyan   
sfc /scannow
Write-Host "[INFO] DISM RestoreHealth..." -ForegroundColor Cyan   
DISM /Online /Cleanup-Image /Restorehealth
Write-Host "[INFO] SFC again to verify repairs..." -ForegroundColor Cyan  
sfc /scannow
Add-Log -Message "[INFO] System health check completed" -ForegroundColor Cyan
