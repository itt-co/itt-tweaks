Write-Host 'This may take a few minutes' -ForegroundColor Yellow

Write-Host 'Running CHKDSK scan...' -ForegroundColor Yellow
Chkdsk /scan

Write-Host 'Running System File Checker (SFC)...' -ForegroundColor Yellow
sfc /scannow

Write-Host 'Running DISM RestoreHealth...' -ForegroundColor Yellow
DISM /Online /Cleanup-Image /Restorehealth

Write-Host 'Running SFC again to verify repairs...' -ForegroundColor Yellow
sfc /scannow

Write-Host 'System health check completed' -ForegroundColor Yellow