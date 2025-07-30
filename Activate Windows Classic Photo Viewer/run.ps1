# PowerShell Script to Set Registry Keys for Windows Photo Viewer Associations

$Registry = @(
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"; Name = ".jpg"; Type = "String"; Value = "PhotoViewer.FileAssoc.Tiff" },
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"; Name = ".jpeg"; Type = "String"; Value = "PhotoViewer.FileAssoc.Tiff" },
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"; Name = ".png"; Type = "String"; Value = "PhotoViewer.FileAssoc.Tiff" },
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"; Name = ".bmp"; Type = "String"; Value = "PhotoViewer.FileAssoc.Tiff" },
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"; Name = ".gif"; Type = "String"; Value = "PhotoViewer.FileAssoc.Tiff" },
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities"; Name = "ApplicationIcon"; Type = "String"; Value = "C:\Program Files (x86)\Windows Photo Viewer\photoviewer.dll" },
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities"; Name = "ApplicationName"; Type = "String"; Value = "Windows Photo Viewer" }
)

foreach ($item in $Registry) {

    $path = $item.Path
    $name = $item.Name
    $type = $item.Type
    $value = $item.Value

    try {
        # Create the key if it doesn't exist
        if (-not (Test-Path $path)) {
            New-Item -Path $path -Force | Out-Null
        }

        # Set the registry value
        New-ItemProperty -Path $path -Name $name -Value $value -PropertyType $type -Force | Out-Null
        Write-Host "Successfully set $name in $path"
    } catch {
        Write-Warning "Failed to set $name in $path: $_"
    }
}
