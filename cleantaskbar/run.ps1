$Registry = @(
    @{ Path = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\NewsAndInterests\AllowNewsAndInterests"; Name = "value"; Type = "DWord"; Value = 0 },
    @{ Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds"; Name = "EnableFeeds"; Type = "DWord"; Value = 0 },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; Name = "ShowTaskViewButton"; Type = "DWord"; Value = 0 },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; Name = "ShowCortanaButton"; Type = "DWord"; Value = 0 },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"; Name = "NoNewsAndInterests"; Type = "DWord"; Value = 1 },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"; Name = "HideSCAMeetNow"; Type = "DWord"; Value = 1 },
    @{ Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People"; Name = "PeopleBand"; Type = "DWord"; Value = 1 },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"; Name = "SearchboxTaskbarMode"; Type = "DWord"; Value = 1 },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds"; Name = "ShellFeedsTaskbarViewMode"; Type = "DWord"; Value = 0 }
)

try {
    # Create HKU drive if it doesn't exist
    if (!(Test-Path 'HKU:\')) {
        New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS | Out-Null
    }

    # Iterate over each registry entry
    foreach ($Reg in $Registry) {
        if ($Reg.Value -ne "Remove") {
            if (!(Test-Path $Reg.Path)) {
                Write-Host -Message "$($Reg.Path) was not found, Creating..."
                New-Item -Path $Reg.Path -Force | Out-Null
            }
            Write-Host -Message "Optimizing $($Reg.Name)..."
            New-ItemProperty -Path $Reg.Path -Name $Reg.Name -PropertyType $Reg.Type -Value $Reg.Value -Force | Out-Null
        } else {
            if ($null -ne $Reg.Name) {
                # Remove the specific registry value
                Write-Host -Message "Removing $($Reg.Name) from registry..."
                Remove-ItemProperty -Path $Reg.Path -Name $Reg.Name -Force -ErrorAction SilentlyContinue
            } else {
                # Remove the registry path
                Write-Host -Message "Removing $($Reg.Path)..."
                Remove-Item -Path $Reg.Path -Recurse -Force -ErrorAction SilentlyContinue
            }
        }
    }
} catch {
    Write-Host "An error occurred: $_"
}

# Restart Explorer
Write-Host "[+] Restarting Explorer..."
Stop-Process -Name explorer -Force
Start-Sleep -Seconds 2
if (-not (Get-Process -Name explorer -ErrorAction SilentlyContinue)) {
    Start-Process explorer.exe -Verb RunAs
}