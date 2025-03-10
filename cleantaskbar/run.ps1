$RegistryItems = @(
    @{
        Path         = "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Feeds"
        Name         = "ShellFeedsTaskbarViewMode"
        Type         = "DWord"
        Value        = "2"
        defaultValue = "0"
    },
    @{
        Path         = "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search"
        Name         = "SearchboxTaskbarMode"
        Type         = "DWord"
        Value        = "1"
        defaultValue = "0"
    },
    @{
        Path         = "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\People"
        Name         = "PeopleBand"
        Type         = "DWord"
        Value        = "0"
        defaultValue = "1"
    },
    @{
        Path         = "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer"
        Name         = "HideSCAMeetNow"
        Type         = "DWord"
        Value        = "1"
        defaultValue = "0"
    },
    @{
        Path         = "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer"
        Name         = "NoNewsAndInterests"
        Type         = "DWord"
        Value        = "1"
        defaultValue = "0"
    }
)

Applying-Tweaks -RegistryItems $RegistryItems