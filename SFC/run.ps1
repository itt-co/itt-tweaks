Write-Host '[i] This may take a few minutes' -ForegroundColor Cyan
Write-Host "[+] CHKDSK scan..." -ForegroundColor Cyan 
Chkdsk /scan
Write-Host "[+] System File Checker (SFC)..." -ForegroundColor Cyan   
sfc /scannow
Write-Host "[+] DISM RestoreHealth..." -ForegroundColor Cyan   
DISM /Online /Cleanup-Image /Restorehealth
Write-Host "[+] SFC again to verify repairs..." -ForegroundColor Cyan  
sfc /scannow
Add-Log -Message "[√] System health check completed" -ForegroundColor Cyan  
