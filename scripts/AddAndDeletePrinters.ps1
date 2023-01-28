If((Test-Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer') -eq $false ) { New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' -force -ea SilentlyContinue } 
If((Test-Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer') -eq $false ) { New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' -force -ea SilentlyContinue } 

New-GPO -Name "Dodawanie/UsuwanieDrukarek" -Comment "Brak możliwości dodawania oraz usuwania drukarek" | New-GPLink -Target "OU=Pracownicy,DC=test,DC=local"

Set-GPRegistryValue -Name "Dodawanie/UsuwanieDrukarek" -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName "NoAddPrinter" -Value 1 -Type DWord
Set-GPRegistryValue -Name "Dodawanie/UsuwanieDrukarek" -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName 'NoDeletePrinter' -Value 1 -Type DWord
