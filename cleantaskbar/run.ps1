$Registry = @(
    @{ Path = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\NewsAndInterests"; Name = "value"; Type = "DWord"; Value = 0 }
    @{ Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds"; Name = "EnableFeeds"; Type = "DWord"; Value = 0 }
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; Name = "ShowTaskViewButton"; Type = "DWord"; Value = 0 }
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; Name = "ShowCortanaButton"; Type = "DWord"; Value = 0 }
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"; Name = "NoNewsAndInterests"; Type = "DWord"; Value = 1 }
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"; Name = "HideSCAMeetNow"; Type = "DWord"; Value = 1 }
    @{ Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People"; Name = "PeopleBand"; Type = "DWord"; Value = 1 }
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"; Name = "SearchboxTaskbarMode"; Type = "DWord"; Value = 1 }
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds"; Name = "ShellFeedsTaskbarViewMode"; Type = "DWord"; Value = 0 }
)

try {
    if (!(Test-Path 'HKU:\')) {
        New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS | Out-Null
    }

    foreach ($Reg in $Registry) {
        # Check if the registry key exists, if not create it
        if (!(Test-Path $Reg.Path)) {
            Write-Host "$($Reg.Path) was not found, creating..."
            New-Item -Path $Reg.Path -Force | Out-Null
        }

        # Check if the property exists, if not create or update it
        if (!(Get-ItemProperty -Path $Reg.Path -Name $Reg.Name -ErrorAction SilentlyContinue)) {
            Write-Host "Property $($Reg.Name) not found in $($Reg.Path), creating..."
            New-ItemProperty -Path $Reg.Path -Name $Reg.Name -PropertyType $Reg.Type -Value $Reg.Value -Force | Out-Null
        } else {
            Write-Host "Property $($Reg.Name) found, updating..."
            Set-ItemProperty -Path $Reg.Path -Name $Reg.Name -Value $Reg.Value -Force | Out-Null
        }
    }
} catch {
    Write-Host "An error occurred: $_"
}

Write-Host "[+] Restarting Explorer..."
Stop-Process -Name explorer -Force
Start-Sleep -Seconds 2
if (-not (Get-Process -Name explorer -ErrorAction SilentlyContinue)) {
    Start-Process explorer.exe -Verb RunAs
}
