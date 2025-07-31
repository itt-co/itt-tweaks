Write-Host "[info] Enabling .NET Framework 3.5 (NetFx3)" -ForegroundColor Cyan
DISM /Online /Enable-Feature /FeatureName:NetFx3 /All
