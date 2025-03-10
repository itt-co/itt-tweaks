$Registry = @(
    @{ Path = "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search"; Name = "BingSearchEnabled"; Type = "DWord"; Value = 0 }
)

foreach ($Item in $Registry) {
    Write-Host "[+] Optmize $($Item.Name)"
    try {
        if (-not (Test-Path $Item.Path)) {
            New-Item -Path $Item.Path -Force | Out-Null
        }
        Set-ItemProperty -Path $Item.Path -Name $Item.Name -Value $Item.Value -Type $Item.Type
    } catch {
        Write-Host "[x] Failed to apply $($Item.Name): $_"
    }
}


Write-Host "[+] Restart explorer."
Stop-Process -Name explorer -Force
Start-Sleep -Seconds 1
if (-not (Get-Process -Name explorer -ErrorAction SilentlyContinue)) {
    Start-Process explorer.exe -Verb RunAs
}