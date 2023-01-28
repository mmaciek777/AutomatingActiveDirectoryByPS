$name = Read-Host -Prompt "Podaj imie i nazwisko użytkownika"

Set-GPPermission -Name "WygaszanieEkranu" -TargetName $name -PermissionLevel GpoEdit -TargetType User
