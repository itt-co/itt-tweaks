$Registry = @(
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"; Name = ".jpg"; Type = "String"; Value = "PhotoViewer.FileAssoc.Tiff" },
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"; Name = ".jpeg"; Type = "String"; Value = "PhotoViewer.FileAssoc.Tiff" },
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"; Name = ".png"; Type = "String"; Value = "PhotoViewer.FileAssoc.Tiff" },
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"; Name = ".bmp"; Type = "String"; Value = "PhotoViewer.FileAssoc.Tiff" },
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"; Name = ".gif"; Type = "String"; Value = "PhotoViewer.FileAssoc.Tiff" },
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"; Name = "ApplicationIcon"; Type = "String"; Value = "C:\Program Files (x86)\Windows Photo Viewer\photoviewer.dll" },
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"; Name = "ApplicationName"; Type = "String"; Value = "Windows Photo Viewer" }
)

foreach ($item in $Registry) {
    try {
        if (!(Test-Path $item.Path)) {
            New-Item -Path $item.Path -Force | Out-Null
        }

        if ($item.Type -eq "DWord") {
            New-ItemProperty -Path $item.Path -Name $item.Name -PropertyType DWord -Value $item.Value -Force | Out-Null
        }
        elseif ($item.Type -eq "String") {
            New-ItemProperty -Path $item.Path -Name $item.Name -PropertyType String -Value $item.Value -Force | Out-Null
        }

        Write-Host "[✓] Set $($item.Name)" -ForegroundColor Green
    } catch {
        Write-Host "[!] Failed to set $($item.Name): $($_.Exception.Message)" -ForegroundColor Red
    }
}
