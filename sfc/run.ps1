Write-Host 'This may take a few minutes' -ForegroundColor Yellow

Write-Host 'CHKDSK scan...' -ForegroundColor Yellow
Chkdsk /scan

Write-Host 'System File Checker (SFC)...' -ForegroundColor Yellow
sfc /scannow

Write-Host 'DISM RestoreHealth...' -ForegroundColor Yellow
DISM /Online /Cleanup-Image /Restorehealth

Write-Host 'SFC again to verify repairs...' -ForegroundColor Yellow
sfc /scannow

Write-Host 'System health check completed' -ForegroundColor Yellow