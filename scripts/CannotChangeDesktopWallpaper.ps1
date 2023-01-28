If((Test-Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop') -eq $false ) { New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop' -force -ea SilentlyContinue } 

New-GPO -Name "BrakZmianyTapety" -Comment "Brak możliwości zmiany tapety przez użytkownika" | New-GPLink -Target "OU=Pracownicy,DC=test,DC=local"

Set-GPRegistryValue -Name "BrakZmianyTapety" -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" -ValueName "NoChangingWallPaper" -Value 1 -Type DWord
