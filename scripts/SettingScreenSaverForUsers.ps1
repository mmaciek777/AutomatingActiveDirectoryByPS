New-GPO -Name "Wygaszanie Ekranu" -Comment "Czas po jakim zostanie wygaszony ekran" | New-GPLink -Target "OU=Pracownicy,DC=test,DC=local"

If((Test-Path 'HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop') -eq $false ) { New-Item -Path 'HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop' -force -ea SilentlyContinue } 

Set-GPRegistryValue -Name "Wygaszanie Ekranu" -Key "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -ValueName 'ScreenSaveTimeOut' -Type DWORD -Value 600