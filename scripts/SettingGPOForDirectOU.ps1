If((Test-Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop') -eq $false ) { New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop' -force -ea SilentlyContinue } 
If((Test-Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer') -eq $false ) { New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' -force -ea SilentlyContinue } 
If((Test-Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer') -eq $false ) { New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' -force -ea SilentlyContinue } 
If((Test-Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer') -eq $false ) { New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' -force -ea SilentlyContinue }
If((Test-Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System') -eq $false ) { New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -force -ea SilentlyContinue } 
If((Test-Path 'HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop') -eq $false ) { New-Item -Path 'HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop' -force -ea SilentlyContinue } 

New-GPO -Name "GPO_Kierownictwo" -Comment "Ustawienia zabezpieczeń dla Kierownictwa" | New-GPLink -Target "OU=Kierownictwo,DC=test,DC=local"

Set-GPRegistryValue -Name "GPO_Kierownictwo" -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName "NoAddPrinter" -Value 1 -Type DWord
Set-GPRegistryValue -Name "GPO_Kierownictwo" -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName 'NoDeletePrinter' -Value 1 -Type DWord
Set-GPRegistryValue -Name "GPO_Kierownictwo" -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" -ValueName "NoChangingWallPaper" -Value 1 -Type DWord
Set-GPRegistryValue -Name "GPO_Kierownictwo" -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName "NoControlPanel" -Value 1 -Type DWord
Set-GPRegistryValue -Name "GPO_Kierownictwo" -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName 'NoDispCPL' -Value 1 -Type DWord
Set-GPRegistryValue -Name "GPO_Kierownictwo" -Key "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -ValueName 'ScreenSaveTimeOut' -Value 600 -Type DWORD 
